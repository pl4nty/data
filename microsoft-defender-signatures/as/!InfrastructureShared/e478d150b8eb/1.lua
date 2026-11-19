-- Threat: !InfrastructureShared
-- Name: e478d150b8eb
-- Type: 21

local l_0_0 = pehdr.DataDirectory[pe.IMAGE_DIRECTORY_ENTRY_SECURITY].RVA
if l_0_0 == 0 and (peattributes.isdll or peattributes.isexe) then
  local l_0_1 = string.lower(mp.getfilename())
  if l_0_1:find("\\windows\\", 1, true) or l_0_1:find(".wim", 1, true) or l_0_1:find(".cab", 1, true) then
    return mp.CLEAN
  end
end
return mp.INFECTED
