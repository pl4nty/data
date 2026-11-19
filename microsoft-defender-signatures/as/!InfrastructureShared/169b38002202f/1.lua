-- Threat: !InfrastructureShared
-- Name: 169b38002202f
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = string.lower(bm.get_imagepath())
if l_0_0 ~= nil and (string.sub(l_0_0, -33) == "\\msexchangemailboxreplication.exe" or string.sub(l_0_0, -23) == "\\msexchangedelivery.exe" or string.sub(l_0_0, -39) == "\\msexchangemailboxreplicationworker.exe") then
  local l_0_1
  if this_sigattrlog[1].matched then
    l_0_1 = this_sigattrlog[1].utf8p1
  elseif this_sigattrlog[2].matched then
    l_0_1 = this_sigattrlog[2].utf8p1
  elseif this_sigattrlog[3].matched then
    l_0_1 = this_sigattrlog[3].utf8p1
  elseif this_sigattrlog[4].matched then
    l_0_1 = this_sigattrlog[4].utf8p1
  end
  if l_0_1 ~= nil then
    local l_0_2 = string.sub(l_0_1, -4)
    local l_0_3 = "|.asp|aspx|ashx|asmx|"
    if string.find(l_0_3, l_0_2, 1, true) == nil then
      return mp.CLEAN
    end
    if sysio.IsFileExists(l_0_1) then
      bm.add_related_file(l_0_1)
      bm.add_threat_file(l_0_1)
    end
    local l_0_4, l_0_5 = pcall(reportBmInfo)
    if not l_0_4 and l_0_5 then
      bm.add_related_string("bmInfoFailReason", tostring(l_0_5), bm.RelatedStringBMReport)
    end
    return mp.INFECTED
  end
end
return mp.CLEAN
