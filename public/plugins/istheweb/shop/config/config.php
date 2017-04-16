<?php

return [
    // This contains the Laravel Packages that you want this plugin to utilize listed under their package identifiers
    'packages' => [
        'sebdesign/laravel-state-machine' => [
            // Service providers to be registered by your plugin
            'providers' => [
                '\Sebdesign\SM\ServiceProvider',
            ],

            // Aliases to be registered by your plugin in the form of $alias => $pathToFacade
            'aliases' => [
                'StateMachine' => '\Sebdesign\SM\Facade',
            ],

            // The namespace to set the configuration under. For this example, this package accesses it's config via config('purifier.' . $key), so the namespace 'purifier' is what we put here
            'config_namespace' => 'purifier',

            // The configuration file for the package itself. Start this out by copying the default one that comes with the package and then modifying what you need.
            'config' => [
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
                            'from' => ['sold'],
                            'to' => 'release',
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
                            'guard_on_submitting' => [
                                // call the callback on a specific transition
                                'on' => 'submit_changes',
                                // will call the method of this class
                                'do' => ['MyClass', 'handle'],
                                // arguments for the callback
                                'args' => ['object'],
                            ],
                        ],

                        // will be called before applying a transition
                        'before' => [],

                        // will be called after applying a transition
                        'after' => [],
                    ],
                ],
            ],
        ],
    ],
];