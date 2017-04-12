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
                'graphA' => [
                    // class of your domain object
                    'class' => App\User::class,

                    // name of the graph (default is "default")
                    'graph' => 'graphA',

                    // property of your object holding the actual state (default is "state")
                    'property_path' => 'state',

                    // list of all possible states
                    'states' => [
                        'new',
                        'pending_review',
                        'awaiting_changes',
                        'accepted',
                        'published',
                        'rejected',
                    ],

                    // list of all possible transitions
                    'transitions' => [
                        'create' => [
                            'from' => ['new'],
                            'to' => 'pending_review',
                        ],
                        'ask_for_changes' => [
                            'from' =>  ['pending_review', 'accepted'],
                            'to' => 'awaiting_changes',
                        ],
                        'cancel_changes' => [
                            'from' => ['awaiting_changes'],
                            'to' => 'pending_review',
                        ],
                        'submit_changes' => [
                            'from' => ['awaiting_changes'],
                            'to' =>  'pending_review',
                        ],
                        'approve' => [
                            'from' => ['pending_review', 'rejected'],
                            'to' =>  'accepted',
                        ],
                        'publish' => [
                            'from' => ['accepted'],
                            'to' =>  'published',
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