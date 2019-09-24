require 'sikulix'
require './class/Faker.rb'
include Sikulix

#path global of the ubication of the images
@@path = "/Users/giovanniarrazola/Documents/Jruby/Exercises/Hubspot/img/"

@@index = 0

@@arregloC = []

@@arregloD = []

@@firstName = ""

def EsperarSiempre(img)
    while not exists(img)
        sleep(2)
    end
end

#method Add Contact
def AddContact()
    lastName = CreateLastName()
    email = CreateEmail(@@firstName)
    EsperarSiempre(@@path+"label_create_contact.png")
    sleep(2)
    type(email)
    sleep(1)
    type(Key.TAB)
    sleep(1)
    type(@@firstName)
    sleep(1)
    type(Key.TAB)
    sleep(1)
    type(lastName)
    sleep(1)
    type(Key.TAB*2)
    sleep(1)
    type(CreateJob())
    sleep(1)
end

#Method Create Company
def CreateCompany()
    click(@@path+"logo_hubspot.png")
    click(@@path+"logo_hubspot.png")
    EsperarSiempre(@@path+"Update_Page.png")
    click(@@path+"contacts.png")
    EsperarSiempre(@@path+"companies.png")
    click(@@path+"companies.png")
    EsperarSiempre(@@path+"create_company.png")
    mouseMove(@@path+"create_company.png")
    click(@@path+"create_company.png")
    EsperarSiempre(@@path+"label_create_company.png")
    sleep(2)
    type(@@arregloD[@@index])
    sleep(1)
    type(Key.TAB)
    sleep(1)
    type(@@arregloC[@@index])
    sleep(1)
    while not exists(@@path+"company_equal.png")
        mouseMove(@@path+"label_add_try_company.png")
        sleep(1)
        mouseMove(0,12)
        sleep(1)
        mouseDown(Button.LEFT)
        mouseUp(Button.LEFT)
        sleep(2)
        name = CreateFirstName().delete(".").delete(" ")
        type(name+@@arregloD[@@index])
        sleep(1)
        type(Key.TAB)
        sleep(1)
        type(name+@@arregloC[@@index])
        sleep(1)
    end
    click(@@path+"create_company.png")
    EsperarSiempre(@@path+"Update_Page.png")
    mouseMove(@@path+"add_contact.png")
    click(@@path+"add_contact.png")
    EsperarSiempre(@@path+"label_add_contact.png")
    @@firstName = CreateFirstName()
    sleep(1)
    type(@@firstName)
    sleep(1)
    click(@@path+"create_new_contact.png")
    count = 0
    while count < 3
        AddContact()
        @@firstName = CreateFirstName()
        click(@@path+"create_add_another.png")
        EsperarSiempre(@@path+"contact_created.png")
        count = count + 1
        sleep(1)
    end
    click(@@path+"exit_contact.png")
end



def TestMain()
    intContador = 0
    while intContador.to_i <= 0
        #question how many company create
        intContador = input("Cantidad de compañias a crear?")
        if intContador.to_i > 0
            @@arregloC = GenerarCompanies(intContador.to_i)
            @@arregloD = GenerarCompanyDomain(@@arregloC)
            while @@index < @@arregloC.length
                #call the method Create Company
                CreateCompany()
                @@index = @@index = 1
            end
        else
            #in case of that false, throw message "the number should be greater that 0"
            popup("Ingrese un numero mayor a 0...")
        end
    end
end

#----------------------start of the program----------------------
#question for know if start the program
if popAsk("El programa debe de comenzar en la pagina principal de hubspot. \n Desea continuar?...")
    TestMain()
else
    popup("Adios...")
    p "Programa finalizado"
end