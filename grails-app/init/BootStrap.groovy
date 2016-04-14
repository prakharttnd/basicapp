import basicapp.User

class BootStrap {

    def init = { servletContext ->
        for (int i = 1; i <= 100; i++) {
            User user = new User(firstName: "User" + i, lastName: "Last" + i, email: "User" + i + "@gmail.com", password: "abcdef")
            user.save(flush: true)
        }
    }
    def destroy = {
    }
}
