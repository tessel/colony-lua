function tap (n) print('1..' .. tostring(n)); end
function ok (cond, why) if not cond then io.write('not '); end print('ok - ' .. tostring(why)); end

tap(13)

ok(tostring(0/0) == 'NaN', 'nan is NaN not nan')
ok((not 0) == true, '0 is falsy')
ok((not "") == true, '"" is falsy')
ok(tonumber(true) == 1, 'can cast boolean to number')
ok((0 or 1) == 1, 'shortcut 0 in boolean operator')
ok(debug.getinfo(function (b, c, d) end, 'u').nparams == 3, 'nparams implemented')

local a = {}
setmetatable(a, { __tovalue = function () return 5; end })
ok(a + 5 == 10, 'can arithmetic objects with __tovalue in arith')

debug.setmetatable(nil, {__lt = function () return true; end })
ok(nil < 5, 'nil comparsions allowed')

debug.setmetatable(0, {__lt = function () return true; end })
debug.setmetatable('', {__lt = function () return true; end })
ok(5 < '6', 'comparison between differing types works')

local a = {}
a['5'] = 1
a[5] = 2
ok(a['5'] == 2, 'numerical keys are converted')
a['nan'] = 1
a['-nan'] = 1
ok(true, 'nan and -nan are allowed')
a['inf'] = 1
a['-inf'] = 1
ok(true, 'inf and -inf are allowed')
a['00'] = 1
a[0] = 2
ok(a['00'] == 1, 'numbers with leading 0 are parsed fully for numericness')
