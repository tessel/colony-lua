print('START');

local a = { hi = "hi", heya = "there", hellos = "amigos", hitheres = "goodbye" --[[, cool = "yep", dudes = "ok" ]]}

print('deleting')

a.hellos = nil
a.hi = nil

print('setting')
print('')

a.abcdefghij = "pear"
a.abcdefghijkl = "cob"

for k, v in pairs(a) do
	print(k, '=>', v)
end

print('')


local b = { 1, 2, 3, 4, 5 }
print(#b, '==5')
b[5] = nil
print(#b, '==5')
b[20] = 5
print(#b, '==20')
