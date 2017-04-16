<?php

return [
    'istheweb_order' => [
        // class of your domain object
        'class' => Istheweb\Shop\Models\Order::class,

        // name of the graph (default is "default")
        'graph' => \Istheweb\Shop\classes\OrderTransitions::GRAPH,

        // property of your object holding the actual state (default is "state")
        'property_path' => 'state',

        // list of all possible states
        'states' => [
            \Istheweb\Shop\Models\Order::STATE_CART,
            \Istheweb\Shop\Models\Order::STATE_NEW,
            \Istheweb\Shop\Models\Order::STATE_CANCELLED,
            \Istheweb\Shop\Models\Order::STATE_CONFIRMED
        ],

        // list of all possible transitions
        'transitions' => [
            \istheweb\shop\classes\OrderTransitions::ISTHEWEB_CREATE => [
                'from' => [\Istheweb\Shop\Models\Order::STATE_CART],
                'to' => \Istheweb\Shop\Models\Order::STATE_NEW,
            ],
            \istheweb\shop\classes\OrderTransitions::ISTHEWEB_CANCEL => [
                'from' =>  [\Istheweb\Shop\Models\Order::STATE_NEW],
                'to' => \Istheweb\Shop\Models\Order::STATE_CANCELLED,
            ],
            \istheweb\shop\classes\OrderTransitions::ISTHEWEB_CONFIRM => [
                'from' => [\Istheweb\Shop\Models\Order::STATE_NEW],
                'to' => \Istheweb\Shop\Models\Order::STATE_CONFIRMED,
            ],
            \istheweb\shop\classes\OrderTransitions::ISTHEWEB_RETURN => [
                'from' => [\Istheweb\Shop\Models\Order::STATE_CONFIRMED],
                'to' =>  \Istheweb\Shop\Models\Order::STATE_NEW,
            ],
        ],

        // list of all callbacks
        'callbacks' => [
            // will be called when testing a transition
            'guard' => [
                'guard_on_hold' => [
                    // call the callback on a specific transition
                    //'on' => 'hold',
                    // will call the method of this class
                    //'do' => ['MyClass', 'handle'],
                    // arguments for the callback
                    //'args' => ['object'],
                ],
            ],

            // will be called before applying a transition
            'before' => [],

            // will be called after applying a transition
            'after' => [],
        ],
    ],
    'istheweb_inventory_unit' => [
        // class of your domain object
        'class' => Istheweb\Shop\Models\InventoryUnit::class,

        // name of the graph (default is "default")
        'graph' => \Istheweb\Shop\Models\InventoryUnit::GRAPH,

        // property of your object holding the actual state (default is "state")
        'property_path' => 'state',

        // list of all possible states
        'states' => [
            \Istheweb\Shop\Models\InventoryUnit::STATE_CHECKOUT,
            \Istheweb\Shop\Models\InventoryUnit::STATE_ONHOLD,
            \Istheweb\Shop\Models\InventoryUnit::STATE_SOLD,
            \Istheweb\Shop\Models\InventoryUnit::STATE_BACKORDERED,
            \Istheweb\Shop\Models\InventoryUnit::STATE_RETURNED
        ],

        // list of all possible transitions
        'transitions' => [
            'hold' => [
                'from' => ['checkout'],
                'to' => 'onhold',
            ],
            'sell' => [
                'from' =>  ['onhold'],
                'to' => 'sold',
            ],
            'release' => [
                'from' => ['onhold'],
                'to' => 'checkout',
            ],
            'return' => [
                'from' => ['sold'],
                'to' =>  'checkout',
            ],
        ],

        // list of all callbacks
        'callbacks' => [
            // will be called when testing a transition
            'guard' => [
                'guard_on_hold' => [
                    // call the callback on a specific transition
                    //'on' => 'hold',
                    // will call the method of this class
                    //'do' => ['MyClass', 'handle'],
                    // arguments for the callback
                    //'args' => ['object'],
                ],
            ],

            // will be called before applying a transition
            'before' => [],

            // will be called after applying a transition
            'after' => [],
        ],
    ],
];
