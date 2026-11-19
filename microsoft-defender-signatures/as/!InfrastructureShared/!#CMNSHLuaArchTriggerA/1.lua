-- Threat: !InfrastructureShared
-- Name: !#CMN:SH/LuaArchTrigger.A
-- Type: 24
-- MpAttributes: RPF:TopLevelFile & (BM_SH_FILE | Lua:SHExt | BM_TEXT_FILE)

local l_0_0 = mp.getfilesize()
if l_0_0 ~= nil and 20480 <= l_0_0 then
  return mp.CLEAN
end
local l_0_1 = mp.enum_mpattributesubstring("SCPT:SH/Architecture_")
if 7 < #l_0_1 then
  return mp.INFECTED
end
local l_0_2 = mp.enum_mpattributesubstring("SCPT:SH/os_distro_")
if 6 < #l_0_1 + #l_0_2 then
  return mp.INFECTED
end
return mp.CLEAN
