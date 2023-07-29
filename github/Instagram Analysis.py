import instaloader
import mysql.connector
import time
from colorama import init, Fore, Style

class InstagramDataLoader:
    def __init__(self, usuario, username, password, host_mysql, user_mysql, password_mysql, database_mysql):
        self.usuario = usuario
        self.username = username
        self.password = password
        self.host_mysql = host_mysql
        self.user_mysql = user_mysql
        self.password_mysql = password_mysql
        self.database_mysql = database_mysql

    def load_data_to_mysql(self):
        # Colorama
        init()
        # MySQL
        conn = mysql.connector.connect(
            host=self.host_mysql,
            user=self.user_mysql,
            password=self.password_mysql,
            database=self.database_mysql
        )

        cursor = conn.cursor()

        # Instaloader
        bot = instaloader.Instaloader()
        bot.load_session_from_file(self.username)
        profile = instaloader.Profile.from_username(bot.context, self.usuario)

        counter = 0
        for post in profile.get_posts():
            counter += 1

            dictionary_mySQL = {
                "id": 0,
                "shortcode": "",
                "tipo": "",
                "cant_likes": 0,
                "cant_comentarios": 0,
                "jesus": 0,
                "maria": 0,
                "jose": 0,
                "sagrada_familia": 0,
                "espiritu_santo": 0,
                "rosario": 0,
                "santos": 0,
                "familia_personal": 0
            }

            dictionary_mySQL["id"] = counter
            dictionary_mySQL["shortcode"] = str(post.shortcode)
            dictionary_mySQL["tipo"] = "video" if post.is_video == True else "foto"
            dictionary_mySQL["cant_likes"] = str(post.likes)
            dictionary_mySQL["cant_comentarios"] = str(post.comments)

            post_text = post.caption.lower()

            if "jesus" in post_text:
                dictionary_mySQL["jesus"] = 1

            if "maria" in post_text:
                dictionary_mySQL["maria"] = 1

            if "jose" in post_text:
                dictionary_mySQL["jose"] = 1

            if "sagrada familia" in post_text or "sagradafamilia" in post_text or (
                    "jesus" in post_text and "maria" in post_text and "jose" in post_text):
                dictionary_mySQL["sagrada_familia"] = 1

            if "espiritu santo" in post_text or "espiritusanto" in post_text or "paraclito" in post_text:
                dictionary_mySQL["espiritu_santo"] = 1

            if "rosario" in post_text:
                dictionary_mySQL["rosario"] = 1

            if "san " in post_text and not "san jose" in post_text:
                dictionary_mySQL["santos"] = 1

            family_text = ["mi bebe", "nuestro bebe", "mi hijo", "mi hija", "nuestro hijo", "nuestra hija",
                           "mi fmailia", "mifamilia", "familia catolica", "familiacatolica"]
            if any(word in post_text for word in family_text):
                dictionary_mySQL["familia_personal"] = 1

            insert_query = "INSERT INTO table_athenastienda (id, shortcode, tipo, cant_likes, cant_comentarios, " \
                           "jesus, maria, jose, sagrada_familia, espiritu_santo, rosario, santos, familia_personal) " \
                           "values (" + str(dictionary_mySQL["id"]) + ",'" + str(dictionary_mySQL["shortcode"]) + "'," \
                           "'" + str(dictionary_mySQL["tipo"]) + "'," + str(dictionary_mySQL["cant_likes"]) + "," \
                           "" + str(dictionary_mySQL["cant_comentarios"]) + "," + str(dictionary_mySQL["jesus"]) + "," \
                           "" + str(dictionary_mySQL["maria"]) + "," + str(dictionary_mySQL["jose"]) + "," \
                           "" + str(dictionary_mySQL["sagrada_familia"]) + "," + str(dictionary_mySQL["espiritu_santo"]) + "," \
                           "" + str(dictionary_mySQL["rosario"]) + "," + str(dictionary_mySQL["santos"]) + "," \
                           "" + str(dictionary_mySQL["familia_personal"]) + ");"

            cursor.execute(insert_query)
            conn.commit()

            print(Fore.GREEN + "Sucess: " + str(counter) + Style.RESET_ALL)

            time.sleep(0, 5)

        cursor.close()
        conn.close()


if __name__ == "__main__":
    # Variables
    usuario = "*******"
    username = "******"
    password = "******"
    host_mysql = "127.0.0.1"
    user_mysql = "root"
    password_mysql = "*******"
    database_mysql = "main_database"

    # Uso de la clase InstagramDataLoader
    loader = InstagramDataLoader(usuario, username, password, host_mysql, user_mysql, password_mysql, database_mysql)
    loader.load_data_to_mysql()