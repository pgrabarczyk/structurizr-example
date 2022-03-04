workspace "Task1" "Example" {

    model {
        user = person "User" "A user of my software system."
        ecommerce_system = softwareSystem "E-commerce system" "My software system." {
            frontend_app = container "Frontend Application" {
                description "Application for browser users"
                technology "Angular"
                tags "frontend_app"
            }
            product_service = container "Product service" {
                description "Backend service for actions related to Products"
                technology "Java SpringBoot"
                tags "product_service"
            }
            android_app = container "Android Application" {
                description "Application for Android users"
                technology "Android"
                tags "android_app"
            }
            ios_app = container "iOS Application" {
                description "Application for iOS users"
                technology "iOS"
                tags "ios_app"
            }
            product_db = container "Product database" {
                description "Store products price and availability"
                technology "AWS RDB"
                tags "product_db"
            }
        }
        payment_system = softwareSystem "3rd party payment system" "Allowing users to pay for products."

        user -> payment_system "Finalize Payment"

        user -> frontend_app "Uses"
        user -> android_app "Uses"
        user -> ios_app "Uses"

        frontend_app -> product_service "Execute API calls about Products"
        android_app -> product_service "Execute API calls about Products"
        ios_app -> product_service "Execute API calls about Products"

        product_service -> product_db "Reads from and writes to"
        product_service -> payment_system "Initialise and confirm payment"
    }

    views {
        theme default

        styles {
            element "frontend_app" {
                icon "https://github.com/pgrabarczyk/structurizr-example/raw/master/Task1/images/Angular.png"
            }
            element "product_service" {
                icon "https://github.com/pgrabarczyk/structurizr-example/raw/master/Task1/images/spring.png"
            }
            element "android_app" {
                icon "https://github.com/pgrabarczyk/structurizr-example/raw/master/Task1/images/android.png"
            }
            element "ios_app" {
                icon "https://github.com/pgrabarczyk/structurizr-example/raw/master/Task1/images/ios.png"
            }
            element "product_db" {
                icon "https://github.com/pgrabarczyk/structurizr-example/raw/master/Task1/images/rds.png"
            }
        }
    }

}
