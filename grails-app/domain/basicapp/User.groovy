package basicapp

import basicapp.co.SearchCO

class User {

    String firstName
    String lastName
    String email
    String password
    Date dateCreated
    Date lastUpdated

    static constraints = {
        firstName nullable: false, blank: false
        lastName nullable: false, blank: false
        email nullable: false, blank: false
        password nullable: false, blank: false
    }

    static namedQueries = {
        search { SearchCO searchCO ->
            if (searchCO.q) {
                or {
                    ilike("firstName", "${searchCO.q}")
                    ilike("lastName", "${searchCO.q}")
                    ilike("email", "${searchCO.q}")
                }
            }
        }
    }
}
