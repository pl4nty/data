-- Threat: !InfrastructureShared
-- Name: !#BM_LOWFI_DHA
-- Type: 13

if mp.get_mpattributesubstring("!dha") and (mp.get_mpattributesubstring("ALF:") or mp.get_mpattributesubstring("SLF:") or mp.get_mpattributesubstring("TEL:") or mp.get_mpattributesubstring("ALFPER:") or mp.get_mpattributesubstring("SLFPER:") or mp.get_mpattributesubstring("TELPER:")) then
  local l_0_0 = {
    "ALF:",
    "SLF:",
    "TEL:",
    "ALFPER:",
    "SLFPER:",
    "TELPER:"
  }
  local l_0_1 = "!dha"
  for l_0_2, l_0_3 in ipairs(l_0_0) do
    local l_0_4 = mp.enum_mpattributesubstring(l_0_3)
    for l_0_5, l_0_6 in ipairs(l_0_4) do
      if l_0_6:sub(-#l_0_1) == l_0_1 then
        local l_0_7 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
        if l_0_7 == nil then
          return mp.INFECTED
        end
        l_0_7 = MpCommon.PathToWin32Path(l_0_7)
        if l_0_7 == nil then
          return mp.INFECTED
        end
        local l_0_8, l_0_9 = string.find(l_0_7, "->")
        if l_0_8 then
          l_0_7 = string.sub(l_0_7, 1, l_0_8 - 1)
        end
        local l_0_10 = MpCommon.GetOriginalFileName(l_0_7)
        if l_0_10 ~= nil and (string.sub(l_0_10, -4):lower() == "!dha" or l_0_10 == "PyArmor") then
          return mp.INFECTED
        end
        local l_0_11 = {
          ["ALF:Trojan:Python/NoteLine.Cert.G!dha"] = true
        }
        if l_0_11[l_0_6] then
          return mp.INFECTED
        end
        MpCommon.SetOriginalFileName(l_0_7, l_0_6)
        return mp.INFECTED
      end
    end
  end
end
return mp.CLEAN
