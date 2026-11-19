-- Threat: !InfrastructureShared
-- Name: 68b34fc92b19
-- Type: 21

local l_0_0
if this_sigattrlog[1].matched then
  local l_0_1 = string.lower(this_sigattrlog[1].utf8p2)
  local l_0_2 = string.match(l_0_1, "%.exe%s(.+%.exe)%s")
  if l_0_2 ~= nil and string.len(l_0_2) > 3 then
    l_0_0 = l_0_2
  end
elseif this_sigattrlog[2].matched then
  local l_0_3 = string.lower(this_sigattrlog[2].utf8p2)
  local l_0_4 = string.match(l_0_3, "%.exe%s\".-([^\\]-[^\\%.]+)\"%s")
  if l_0_4 ~= nil and string.len(l_0_4) > 3 then
    l_0_0 = l_0_4
  end
end
if l_0_0 == nil or string.len(l_0_0) < 4 or string.sub(l_0_0, -4) ~= ".exe" then
  return mp.CLEAN
end
local l_0_5 = "HKLM\\SOFTWARE\\Microsoft\\Windows NT\\CurrentVersion\\Image File Execution Options\\" .. l_0_0
local l_0_6 = sysio.RegOpenKey(l_0_5)
if l_0_6 ~= nil then
  local l_0_7 = sysio.GetRegValueAsString(l_0_6, "Debugger")
  if l_0_7 ~= nil and 1 <= string.len(l_0_7) then
    if sysio.IsFileExists(l_0_7) then
      mp.ReportLowfi(l_0_7, 1806419140)
      bm.add_related_file(l_0_7)
    else
      local l_0_8 = mp.GetExecutablesFromCommandLine(l_0_7)
      for l_0_9, l_0_10 in ipairs(l_0_8) do
        if l_0_10 ~= nil and string.len(l_0_10) > 3 and sysio.IsFileExists(l_0_10) then
          mp.ReportLowfi(l_0_10, 1806419140)
          bm.add_related_file(l_0_10)
        end
      end
    end
    return mp.INFECTED
  end
end
return mp.CLEAN
