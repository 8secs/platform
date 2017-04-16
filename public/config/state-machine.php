<?php

return [
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
