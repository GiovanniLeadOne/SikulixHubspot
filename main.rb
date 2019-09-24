require 'sikulix'
require './class/Faker.rb'
include Sikulix

#path global of the ubication of the images
@@path = "/Users/giovanniarrazola/Documents/Jruby/Exercises/Hubspot/img/"

@@index = 0

def EsperarSiempre(img)
    while not exists(img)
        sleep(2)
    end
end

#method Add Contact
def AddContact()
end

#Method Create Company
def CreateCompany(arregloCom, arregloDom)
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
    type(arregloDom[@@index])
    sleep(1)
    type(Key.TAB)
    type(arregloCom[@@index])
    sleep(1)
    click(@@path+"create_company.png")
end



def TestMain()
    intContador = 0
    while intContador.to_i <= 0
        #question how many company create
        intContador = input("Cantidad de compañias a crear?")
        if intContador.to_i > 0
            arregloC = GenerarCompanies(intContador.to_i)
            arregloD = GenerarCompanyDomain(arregloC)
            while @@index < arregloC.length
                #call the method Create Company
                CreateCompany(arregloC , arregloD)
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