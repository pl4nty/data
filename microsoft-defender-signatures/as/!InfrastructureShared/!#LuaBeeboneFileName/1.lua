-- Threat: !InfrastructureShared
-- Name: !#Lua:BeeboneFileName
-- Type: 8

if not peattributes.isexe then
  return mp.CLEAN
end
if mp.getfilesize() > 307200 or mp.getfilesize() < 14336 then
  return mp.CLEAN
end
local l_0_0, l_0_1, l_0_2
local l_0_3 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_3 == mp.SCANREASON_ONOPEN or l_0_3 == mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  l_0_2 = mp.get_contextdata(mp.CONTEXT_DATA_FILENAME)
  l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_FILEPATH)
end
if l_0_2 == nil then
  l_0_0 = mp.getfilename()
  l_0_1 = l_0_0:sub(-4)
else
  l_0_1 = l_0_2:sub(-4)
end
if l_0_1 ~= ".exe" then
  return mp.CLEAN
end
if l_0_2 == nil then
  l_0_2 = l_0_0:match("([^\\]+)$")
end
if (#l_0_2 == 10 or #l_0_2 == 9) and l_0_0:find("\\Users\\", 1, true) then
  local l_0_4, l_0_5, l_0_6, l_0_7, l_0_8 = l_0_2:match("^%l?([^aeiou])([aeiou])([^aeiou])([aeiou])([^aeiou])%.exe")
  if l_0_4 and l_0_5 and l_0_6 and l_0_7 and l_0_8 and l_0_4 == l_0_6 and l_0_6 == l_0_8 and l_0_5 == l_0_7 then
    return mp.INFECTED
  end
end
return mp.CLEAN
