require 'sikulix'
require './class/Faker.rb'
include Sikulix


def CreateCompany(arregloCom, arregloDom)

end



def TestMain()
    intContador = 0
    while intContador.to_i <= 0
        intContador = input("Cantidad de compañias a crear?")
        if intContador.to_i > 0
            arreglo = GenerarCompanies(intContador.to_i)
            CreateCompany(arreglo , GenerarCompanyDomain(arreglo))
        else
            popup("Ingrese un numero mayor a 0...")
        end
    end
end

#Comienzo del programa
if popAsk("El programa debe de comenzar en la pagina principal de hubspot. \n Desea continuar?...")
    TestMain()
else
    popup("Adios...")
    p "Programa finalizado"
end