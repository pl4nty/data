-- Threat: !#SCPT:Nemucod_exclusion
-- Type: 13
-- MpAttributes: Nscript:Type_js & !SCPT:Nemucod_exclusion

local l_0_0 = string.lower(mp.getfilename())
if string.find(l_0_0, "%-%>%(pdf00[0-9][0-9]?%:") ~= nil then
  return mp.INFECTED
end
return mp.CLEAN
