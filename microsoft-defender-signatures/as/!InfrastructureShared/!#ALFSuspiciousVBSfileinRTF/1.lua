-- Threat: !InfrastructureShared
-- Name: !#ALF:SuspiciousVBSfileinRTF
-- Type: 13
-- MpAttributes: Nscript:Type_vbs & Lua:VBSExt

local l_0_0 = mp.getfilesize()
if 100 < l_0_0 and l_0_0 < 1000000 then
  local l_0_1 = string.lower(mp.getfilename())
  if string.match(l_0_1, "rtf%d.+->.+") then
    return mp.INFECTED
  end
end
return mp.CLEAN
