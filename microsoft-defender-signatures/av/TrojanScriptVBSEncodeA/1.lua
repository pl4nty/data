-- Threat: Trojan:Script/VBSEncode.A
-- Type: 13
-- MpAttributes: !RPF:TopLevelFile & SCRIPT:PsIex.A

local l_0_0, l_0_1 = mp.getfilename(mp.bitor(mp.bitor(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_PATH), mp.FILEPATH_QUERY_LOWERCASE))
if l_0_0 ~= nil and l_0_0:len() > 10 and l_0_1 ~= nil and l_0_1:find("->[embeddedstring]->", 1, true) and l_0_1:find("->[embeddedenc]->", 1, true) and l_0_1:find("->(base64)", 1, true) then
  return mp.INFECTED
end
return mp.CLEAN
