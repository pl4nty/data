-- Threat: !InfrastructureShared
-- Name: !#IOAVLogSkip
-- Type: 26

local function l_0_0(l_1_0, l_1_1)
  return l_1_1 == "" or string.sub(l_1_0, -string.len(l_1_1)) == l_1_1
end

local l_0_1 = skip.GetScanSource()
if l_0_1 ~= skip.SCANSOURCE_IOAV_WEB and l_0_1 ~= skip.SCANSOURCE_IOAV_FILE then
  return 0
end
local l_0_2 = skip.IOAVGetProcessPath()
if l_0_2 == nil then
  return 0
end
l_0_2 = string.lower(l_0_2)
if l_0_0(l_0_2, "\\winword.exe") then
  return 1
end
if l_0_0(l_0_2, "\\excel.exe") then
  return 1
end
if l_0_0(l_0_2, "\\powerpnt.exe") then
  return 1
end
if l_0_1 == skip.SCANSOURCE_IOAV_FILE and (l_0_0(l_0_2, "\\explorer.exe") or l_0_0(l_0_2, "\\pr_zip_03_uncompressfiles.exe")) then
  return 1
end
if l_0_1 == skip.SCANSOURCE_IOAV_FILE then
  local l_0_3 = skip.IOAVGetDownloadUrl()
  if l_0_3 ~= nil then
    local l_0_4 = skip.IOAVGetUrlPart(l_0_3, 2, 0)
    if l_0_4 ~= nil then
      l_0_4 = string.lower(l_0_4)
      if l_0_4 == "microsoft.com" or l_0_0(l_0_4, ".microsoft.com") then
        return 1
      end
    end
  end
end
return 0
