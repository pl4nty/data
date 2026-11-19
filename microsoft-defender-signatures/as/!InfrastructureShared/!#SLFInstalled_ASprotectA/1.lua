-- Threat: !InfrastructureShared
-- Name: !#SLF:Installed_ASprotect.A
-- Type: 9
-- MpAttributes: MpNewlyCreatedHint & ASProtect_Hint & FOP:Hupigon.AsProtect

local l_0_0 = mp.getfilename(mp.FILEPATH_QUERY_LOWERCASE)
if string.find(l_0_0, "\\appdata\\", 1, true) or string.find(l_0_0, "\\program files\\", 1, true) or string.find(l_0_0, "\\program files (x86)\\", 1, true) then
  return mp.INFECTED
end
return mp.CLEAN
