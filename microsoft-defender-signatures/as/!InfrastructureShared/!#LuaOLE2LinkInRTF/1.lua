-- Threat: !InfrastructureShared
-- Name: !#Lua:OLE2LinkInRTF
-- Type: 13
-- MpAttributes: SCPT:OLE2Link | SCRIPT:OLE.LinkInfo | SCRIPT:CVE-2017-0199.Toolkit.A | SCRIPT:CVE-2017-0199.Toolkit.B

local l_0_0 = mp.getfilename()
if string.find(l_0_0, "->[NormalizedRTF]", 1, true) ~= nil then
  mp.set_mpattribute("Lua:OLE2LinkInNormalizedRTF")
end
if string.find(l_0_0, "->(Rtf", 1, true) ~= nil then
  return mp.INFECTED
end
return mp.CLEAN
