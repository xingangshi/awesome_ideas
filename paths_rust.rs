mod front_of_house {
    pub mod hosting {
        pub fn add_to_waitlist() {
            println!("Added a waitlist");
        }
    }

    pub mod serving {
        pub fn take_order() {
            println!("Order taken");
        }
    }
}

use crate::front_of_house::hosting;
use crate::front_of_house::serving;

use crate::front_of_house::hosting::add_to_waitlist;
use crate::front_of_house::serving::take_order;

fn main() {
    // Using absolute path
    crate::front_of_house::hosting::add_to_waitlist();

    // Using relative path
    front_of_house::serving::take_order();

    hosting::add_to_waitlist();
    serving::take_order();

    add_to_waitlist();
    take_order();
}
