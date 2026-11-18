-- Threat: !InfrastructureShared
-- Name: b9b398c1ce03
-- Type: 21

local l_0_0
if this_sigattrlog[2].matched then
  l_0_0 = string.lower(this_sigattrlog[2].utf8p1)
elseif this_sigattrlog[3].matched then
  l_0_0 = string.lower(this_sigattrlog[3].utf8p1)
end
if l_0_0 ~= nil then
  local l_0_1 = string.sub(l_0_0, -4)
  local l_0_2 = "|.asp|aspx|ashx|asmx|"
  if string.find(l_0_2, l_0_1, 1, true) then
    if sysio.IsFileExists(l_0_0) then
      local l_0_3 = string.match(l_0_0, "(.*\\)[^\\]+$")
      if l_0_3 then
        bm.trigger_sig("TriggerShellPath", l_0_3)
      end
      mp.ReportLowfi(l_0_0, 3496458548)
      bm.add_related_file(l_0_0)
      bm.add_threat_file(l_0_0)
    end
    return mp.INFECTED
  end
end
return mp.CLEAN
