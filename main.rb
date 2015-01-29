#/usr/bin/ruby

load 'navegador.rb'

def fill_lista
lista = []
d = Navegador.new()
d.fecha = Date::new(2015,3,15)
d.ciudad1 = "mad"
d.ciudad2 = "bcn"

20.times{
lista << d.get_precio
d.fecha = d.fecha.next_day
}
d.driver.close
return lista
end
	
