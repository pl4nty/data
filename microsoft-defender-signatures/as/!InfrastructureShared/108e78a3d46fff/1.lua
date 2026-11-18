-- Threat: !InfrastructureShared
-- Name: 108e78a3d46fff
-- Type: 21

if not mp.get_mpattribute("RPF:TopLevelFile") then
  return mp.CLEAN
end
if mp.get_mpattribute("CMN:HSTR:InstallerFile") then
  return mp.CLEAN
end
local l_0_0 = mp.getfilesize()
if 1800000 < l_0_0 or l_0_0 < 4000 then
  return mp.CLEAN
end
if mp.get_mpattribute("PEPCODE:HasDigitalSignature") then
  return mp.CLEAN
end
if mp.get_mpattribute("pea_ismsil") then
  return mp.CLEAN
end
if mp.get_mpattribute("pea_isdriver") then
  return mp.CLEAN
end
local l_0_1 = mp.enum_mpattributesubstring("Exploit:")
if 0 < #l_0_1 then
  return mp.CLEAN
end
local l_0_2 = mp.enum_mpattributesubstring("TEL:Exploit:")
if 0 < #l_0_2 then
  return mp.CLEAN
end
local l_0_3 = MpCommon.PathToWin32Path(mp.getfilename(mp.FILEPATH_QUERY_FULL)):lower()
if l_0_3:find("\\immunity", 1, true) or l_0_3:find("\\canvas", 1, true) then
  mp.set_mpattribute("HSTR:ImmunityCanvasFile")
  return mp.CLEAN
end
if l_0_3:find("program files", 1, true) then
  return mp.CLEAN
end
if l_0_3:find("system32", 1, true) then
  return mp.CLEAN
end
if l_0_3:find("\\matlab\\", 1, true) then
  return mp.CLEAN
end
if l_0_3:find("picus", 1, true) then
  return mp.CLEAN
end
if l_0_3:find("syswow64", 1, true) then
  return mp.CLEAN
end
if l_0_3:find("\\cylance", 1, true) then
  return mp.CLEAN
end
if l_0_3:find("libclang", 1, true) then
  return mp.CLEAN
end
if l_0_3:find("introum_steal_token", 1, true) then
  return mp.CLEAN
end
if l_0_3:find("metasploit", 1, true) then
  return mp.CLEAN
end
if l_0_3:find("softwaredistribution", 1, true) then
  return mp.CLEAN
end
if l_0_3:find("\\protector32", 1, true) then
  return mp.CLEAN
end
if l_0_3:find("\\unrealeditor", 1, true) then
  return mp.CLEAN
end
if l_0_3:find("\\sbsimulation", 1, true) then
  return mp.CLEAN
end
return mp.INFECTED
