-- Threat: !InfrastructureShared
-- Name: !#Lua:FakeMscoree
-- Type: 10

if not peattributes.isdll then
  return mp.CLEAN
end
if not peattributes.no_security then
  return mp.CLEAN
end
if peattributes.ismsil then
  return mp.CLEAN
end
if peattributes.packersigmatched then
  return mp.CLEAN
end
if peattributes.resource_only_dll then
  return mp.CLEAN
end
local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_0 ~= "mscoree.dll" then
  return mp.CLEAN
end
if mp.get_mpattribute("HSTR:CleanMscoreeString") then
  return mp.CLEAN
end
if mp.get_mpattribute("Lua:PE:UpxSection") then
  return mp.CLEAN
end
local l_0_1 = mp.enum_mpattributesubstring("Ramnit")
if 0 < #l_0_1 then
  return mp.CLEAN
end
local l_0_2 = mp.getfilesize()
if 350000 < l_0_2 or l_0_2 < 20000 then
  return mp.CLEAN
end
local l_0_3, l_0_4 = pe.get_exports()
if l_0_3 < 3 then
  mp.set_mpattribute("Lua:FakeMscoree.SmallNumExports")
  return mp.INFECTED
end
if (l_0_3 == 5 or l_0_3 == 10) and pe.query_import(pe.IMPORT_STATIC, 2420465236) then
  mp.set_mpattribute("Lua:FakeMscoree.ShellcodeLoader")
  return mp.INFECTED
end
local l_0_5, l_0_6 = pe.get_imports()
if 1 < l_0_5 and l_0_5 < 75 then
  mp.set_mpattribute("Lua:FakeMscoree.SmallNumImports")
  return mp.INFECTED
end
return mp.CLEAN
