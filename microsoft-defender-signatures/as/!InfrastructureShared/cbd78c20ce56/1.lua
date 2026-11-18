-- Threat: !InfrastructureShared
-- Name: cbd78c20ce56
-- Type: 21
-- Includes: LuaFuncHelper, AppomalyHelpers, BMLuaLib, HvaLookupHelpers

local l_0_0 = {
  "httpd.exe",
  "tomcat",
  "nginx",
  "w3wp",
  "apache"
}
local l_0_1 = mp.GetParentProcInfo()
if l_0_1 and l_0_1.image_path then
  local l_0_2 = l_0_1.image_path:match("([^\\]+)$") or ""
  if Contains_any_caseinsenstive(l_0_2, l_0_0) then
    local l_0_3 = mp.GetScannedPPID()
    if l_0_3 == "" or l_0_3 == nil then
      return mp.CLEAN
    end
    local l_0_4 = mp.GetProcessCommandLine(l_0_3)
    if l_0_4 and Contains_any_caseinsenstive(l_0_4, {
      "downloadstring",
      "downloadfile"
    }) then
      local l_0_5 = "((ftp|http[s]?)://[^\\\"\\s\\']+)"
      local l_0_6 = table_dedup(multi_match_regex(l_0_4, l_0_5))
      local l_0_7 = {}
      for l_0_8, l_0_9 in ipairs(l_0_6) do
        local l_0_10, l_0_11 = UrlGrader(l_0_9, "ALF:Trojan:Win32/PFApp_SuspDownload.A", false)
        if l_0_10 < 0 then
          return mp.CLEAN
        end
        if l_0_10 ~= 0 then
          l_0_7[l_0_9] = l_0_11
        end
      end
      local l_0_12, l_0_13 = safeJsonSerialize(l_0_7, 150, nil, true)
      if not string.find(l_0_12, "Susfile_extension", 1, true) then
        return mp.CLEAN
      end
      local l_0_14 = ""
      if IsDeviceHVA() then
        l_0_14 = ExtractDeviceProperties()
      end
      MpCommon.BmTriggerSig(l_0_1.ppid, "APML_SuspDownload_Servers", l_0_4 .. "[URLs]" .. l_0_12 .. "[HVA]" .. l_0_14)
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
