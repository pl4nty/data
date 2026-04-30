-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\eeb3549a5f58\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = this_sigattrlog[4]
if not l_0_0.matched or not l_0_0.ppid or not l_0_0.utf8p2 then
  return mp.CLEAN
end
local l_0_1 = {}
l_0_1["Trojan:Win64/Emotet.ZZ!sms"] = true
l_0_1["Trojan:Win32/Emotet.ZY!sms"] = true
l_0_1["Trojan:Win32/Qakbot.U!sms"] = true
l_0_1["TrojanDownloader:Win64/IcedID.ZZ!sms"] = true
l_0_1["TrojanDownloader:Win64/IcedID.ZW!sms"] = true
l_0_1["TrojanDownloader:Win64/IcedID.ZV!sms"] = true
l_0_1["Trojan:Win32/DarkGate.ZZ!sms"] = true
l_0_1["Trojan:Win32/DarkGate.ZY!sms"] = true
l_0_1["Trojan:Win32/DarkGate.ZX!sms"] = true
l_0_1["Trojan:Win32/PikaBot.ZZ!sms"] = true
l_0_1["HackTool:Win64/CobaltStrike.I!sms"] = true
l_0_1["Trojan:Win64/CobaltStrike.C!sms"] = true
l_0_1["HackTool:Win64/CobaltStrike.F!sms"] = true
l_0_1["HackTool:Win64/CobaltStrike.G!sms"] = true
l_0_1["HackTool:Win64/CobaltStrike.E!sms"] = true
l_0_1["VirTool:Win32/CobaltStrike.A"] = true
l_0_1["HackTool:Win64/CobaltStrike.K!sms"] = true
l_0_1["Trojan:Win64/Qakbot.A!sms"] = true
l_0_1["VirTool:Win32/Bruterat.A!sms"] = true
l_0_1["Trojan:Win32/Latrodectus.A!sms"] = true
l_0_1["Trojan:Win32/SystemBC.SA!sms"] = true
l_0_1["Backdoor:Win32/Coroxy.E!sms"] = true
l_0_1["Trojan:Win64/Shaolaod.A!sms"] = true
l_0_1["Trojan:Win32/Lummac.SD!sms"] = true
l_0_1["Trojan:Win32/Lummac.SDA!sms"] = true
l_0_1["Trojan:Win32/Lummac.SB!sms"] = true
l_0_1["Trojan:Win32/LummaStealer.STB!sms"] = true
l_0_1["Trojan:Win32/LummaStealer.STE!sms"] = true
l_0_1["Trojan:Win32/LummaStealer.STG!sms"] = true
l_0_1["Trojan:Win32/LummaStealer.Z!sms"] = true
l_0_1["Trojan:Win32/Zloader.B!sms"] = true
l_0_1["Trojan:Win32/Amadey.Y!sms"] = true
l_0_1["Trojan:Win64/Amadey.Y!sms"] = true
l_0_1["Trojan:Win32/Amadey.Z!sms"] = true
l_0_1["Trojan:Win64/Amadey.Z!sms"] = true
l_0_1["Trojan:Win32/Amadey.ZZ!sms"] = true
l_0_1["Trojan:Win64/Amadey.ZZ!sms"] = true
l_0_1["Trojan:Win64/Stealc.ZZ!sms"] = true
l_0_1["Trojan:Win64/Stealc.ZY!sms"] = true
l_0_1["PWS:Win64/StealC.STA!sms"] = true
l_0_1["Trojan:Win64/Petwosel.A!sms"] = true
local l_0_2 = true
if not l_0_1[l_0_0.utf8p2] then
  l_0_2 = false
end
do
  if not l_0_2 then
    local l_0_3 = mp.SIGATTR_LOG_SZ
    for l_0_7 = l_0_3, 1, -1 do
      if (sigattr_tail[l_0_7]).attribute == 16491 and (sigattr_tail[l_0_7]).utf8p1 == "SmsScanDetection" then
        local l_0_8 = ((sigattr_tail[l_0_7]).utf8p2):lower()
        if l_0_8 then
          local l_0_9 = {}
          -- DECOMPILER ERROR at PC89: No list found for R9 , SetList fails

          -- DECOMPILER ERROR at PC90: Overwrote pending register: R10 in 'AssignReg'

          if ("trojan:win64/stealc.zy")(l_0_8, l_0_9) then
            do
              do
                l_0_2 = true
                do break end
                -- DECOMPILER ERROR at PC98: LeaveBlock: unexpected jumping out DO_STMT

                -- DECOMPILER ERROR at PC98: LeaveBlock: unexpected jumping out IF_THEN_STMT

                -- DECOMPILER ERROR at PC98: LeaveBlock: unexpected jumping out IF_STMT

                -- DECOMPILER ERROR at PC98: LeaveBlock: unexpected jumping out IF_THEN_STMT

                -- DECOMPILER ERROR at PC98: LeaveBlock: unexpected jumping out IF_STMT

                -- DECOMPILER ERROR at PC98: LeaveBlock: unexpected jumping out IF_THEN_STMT

                -- DECOMPILER ERROR at PC98: LeaveBlock: unexpected jumping out IF_STMT

              end
            end
          end
        end
      end
    end
  end
  if not l_0_2 then
    (bm.trigger_sig)("MaceNonVetted_Sig", tostring(l_0_0.utf8p2))
    return mp.CLEAN
  end
  local l_0_10 = (string.format)("DetectedRegions:%s", l_0_0.ppid)
  local l_0_11 = GetRollingQueue(l_0_10)
  if not l_0_11 or type(l_0_11) ~= "table" then
    return mp.CLEAN
  end
  local l_0_12 = 0
  for l_0_16,l_0_17 in ipairs(l_0_11) do
    local l_0_18 = 32768
    for l_0_22 = 1, #l_0_17.value, l_0_18 do
      l_0_12 = l_0_12 + 1
      local l_0_23 = (string.format)("f09d0e89_%d", l_0_12)
      local l_0_24 = (string.sub)(l_0_17.value, l_0_22, l_0_22 + l_0_18 - 1)
      ;
      (bm.add_related_string)(l_0_23, l_0_24, bm.RelatedStringBMReport)
    end
    if l_0_12 == 0 then
      return mp.CLEAN
    end
    l_0_12 = l_0_12 + 1
    local l_0_25 = (string.format)("f09d0e89_%d", l_0_12)
    ;
    (bm.add_related_string)(l_0_25, ";", bm.RelatedStringBMReport)
  end
  if l_0_12 == 0 then
    return mp.CLEAN
  end
  ;
  (bm.add_related_string)("d9f18702", l_0_0.utf8p2, bm.RelatedStringBMReport)
  return mp.INFECTED
end

