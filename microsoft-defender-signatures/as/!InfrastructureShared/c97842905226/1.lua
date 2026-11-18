-- Threat: !InfrastructureShared
-- Name: c97842905226
-- Type: 21

if peattributes.isdll == true or peattributes.isexe == true then
  if mp.getfilesize() >= 399360 then
    return mp.CLEAN
  end
  local l_0_0 = mp.GetCertificateInfo()
  if l_0_0 ~= nil and 0 < #l_0_0 and mp.IsTrustedFile() then
    return mp.CLEAN
  end
  local l_0_1 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_LOWERCASE, mp.FILEPATH_QUERY_FULL))
  if l_0_1 ~= nil and string.find(l_0_1, "\\temp\\sb", 1, true) then
    mp.set_mpattribute("HSTR:Edrblok.ED.SBPath")
  end
  return mp.INFECTED
end
return mp.CLEAN
