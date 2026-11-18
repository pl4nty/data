-- Threat: !InfrastructureShared
-- Name: !#Lua:MacroFileSizeLess1MB
-- Type: 13
-- MpAttributes: MHSTR:MacroInside

local l_0_0 = mp.getfilesize()
if l_0_0 < 524288 then
  mp.set_mpattribute("MACRO_FILE_SIZE:L0.5MB")
end
return mp.CLEAN
