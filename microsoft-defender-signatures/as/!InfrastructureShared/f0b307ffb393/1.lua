-- Threat: !InfrastructureShared
-- Name: f0b307ffb393
-- Type: 21

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[1].utf8p2
end
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = "c:\\programdata\\%l+%d%d%d%.ps1"
local l_0_2 = string.match(l_0_0:lower(), l_0_1)
if l_0_2 == nil then
  return mp.CLEAN
end
if l_0_2 ~= nil and sysio.IsFileExists(l_0_2) then
  mp.ReportLowfi(l_0_2, 2840082329)
  bm.add_related_file(l_0_2)
  local l_0_3 = sysio.GetFileSize(l_0_2)
  if 2048 < l_0_3 then
    return mp.INFECTED
  end
  local l_0_4 = tostring(sysio.ReadFile(l_0_2, 0, l_0_3))
  if l_0_4 == nil then
    return mp.INFECTED
  end
  local l_0_5 = string.match(l_0_4:lower(), "-name%s+(%w+)")
  local l_0_6 = string.gsub(string.match(l_0_4:lower(), "-path%s+\"(.-)\""), ":", "")
  if l_0_5 == nil or l_0_6 == nil then
    return mp.CLEAN
  end
  local l_0_7
  local l_0_8 = sysio.RegExpandUserKey(l_0_6)
  if l_0_8 then
    for l_0_9, l_0_10 in pairs(l_0_8) do
      local l_0_11 = sysio.RegOpenKey(l_0_10)
      if l_0_11 then
        local l_0_12 = sysio.RegEnumValues(l_0_11)
        for l_0_13, l_0_14 in pairs(l_0_12) do
          if string.lower(l_0_14) == l_0_5 then
            l_0_7 = string.lower(sysio.GetRegValueAsString(l_0_11, l_0_14))
          end
        end
      end
    end
  end
  if l_0_7 ~= nil then
    bm.add_related_string("b64_SuspQuickRapidsPSFile_regvalue", MpCommon.Base64Encode(l_0_7), bm.RelatedStringBMReport)
  end
end
return mp.INFECTED
