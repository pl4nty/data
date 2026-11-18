-- Threat: !InfrastructureShared
-- Name: !#ALF:Backdoor:Linux/GreenViper.C!dha
-- Type: 24
-- MpAttributes: BM_ELF_FILE & (Lua:POSSIBLE_UPX_MAGIC | Lua:POSSIBLE_UPX)

local l_0_0 = mp.getfilesize()
if 32768 < l_0_0 then
  return mp.CLEAN
end
local l_0_1 = mp.get_mpattributevalue("Lua:POSSIBLE_UPX_MAGIC")
if l_0_1 == nil then
  return mp.CLEAN
end
if mp.bitand(l_0_1, 558056007) == 558056007 or mp.bitand(l_0_1, 558056001) == 558056001 then
  return mp.INFECTED
end
return mp.CLEAN
