-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#SLFTrojanAIPromptInjectSuspPromptD\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = 1536000
local l_0_1 = 32
local l_0_2 = 1024
local l_0_3 = (mp.get_contextdata)(mp.CONTEXT_DATA_SCANREASON)
if l_0_3 == nil or l_0_3 ~= mp.SCANREASON_NET_PROMPTSTREAM then
  return mp.CLEAN
end
local l_0_4 = nil
local l_0_5 = (mp.get_contextdata)(mp.CONTEXT_DATA_NET_PROMPT_LAST_MESSAGE)
do
  if l_0_5 ~= nil then
    local l_0_6 = tostring(l_0_5)
    if l_0_1 <= #l_0_6 then
      l_0_4 = l_0_6
    end
  end
  do
    if (mp.getfilesize)() or l_0_0 < l_0_4 ~= nil or 0 then
      local l_0_7, l_0_8, l_0_9 = l_0_0
    end
    -- DECOMPILER ERROR at PC43: Confused about usage of register: R6 in 'UnsetPending'

    if l_0_1 <= l_0_7 then
      (mp.readprotection)(false)
      -- DECOMPILER ERROR at PC52: Confused about usage of register: R6 in 'UnsetPending'

      local l_0_10 = nil
      ;
      (mp.readprotection)(true)
      if (mp.readfile)(0, l_0_7) ~= nil then
        l_0_4 = tostring((mp.readfile)(0, l_0_7))
      end
    end
    do
      if l_0_4 == nil or #l_0_4 < l_0_1 then
        return mp.CLEAN
      end
      if l_0_0 < #l_0_4 then
        l_0_4 = (string.sub)(l_0_4, 1, l_0_0)
      end
      local l_0_11 = (string.lower)(l_0_4)
      local l_0_12 = {}
      -- DECOMPILER ERROR at PC103: No list found for R7 , SetList fails

      local l_0_13 = {}
      local l_0_14 = {}
      -- DECOMPILER ERROR at PC106: Overwrote pending register: R10 in 'AssignReg'

      -- DECOMPILER ERROR at PC107: Overwrote pending register: R11 in 'AssignReg'

      -- DECOMPILER ERROR at PC108: Overwrote pending register: R12 in 'AssignReg'

      -- DECOMPILER ERROR at PC109: No list found for R9 , SetList fails

      -- DECOMPILER ERROR at PC110: Overwrote pending register: R10 in 'AssignReg'

      local l_0_15 = "api[_%s%-]?key"
      -- DECOMPILER ERROR at PC111: Overwrote pending register: R11 in 'AssignReg'

      local l_0_16 = "credential"
      -- DECOMPILER ERROR at PC112: Overwrote pending register: R12 in 'AssignReg'

      local l_0_17 = "secret"
      -- DECOMPILER ERROR at PC113: Overwrote pending register: R13 in 'AssignReg'

      local l_0_18 = "private key"
      -- DECOMPILER ERROR at PC114: Overwrote pending register: R14 in 'AssignReg'

      local l_0_19 = "confidential"
      -- DECOMPILER ERROR at PC115: Overwrote pending register: R15 in 'AssignReg'

      local l_0_20 = "access token"
      local l_0_21 = {}
      -- DECOMPILER ERROR at PC117: Overwrote pending register: R17 in 'AssignReg'

      -- DECOMPILER ERROR at PC118: Overwrote pending register: R18 in 'AssignReg'

      -- DECOMPILER ERROR at PC119: Overwrote pending register: R19 in 'AssignReg'

      -- DECOMPILER ERROR at PC120: No list found for R16 , SetList fails

      local l_0_22 = {}
      -- DECOMPILER ERROR at PC122: Overwrote pending register: R18 in 'AssignReg'

      -- DECOMPILER ERROR at PC123: Overwrote pending register: R19 in 'AssignReg'

      -- DECOMPILER ERROR at PC124: Overwrote pending register: R20 in 'AssignReg'

      -- DECOMPILER ERROR at PC125: No list found for R17 , SetList fails

      -- DECOMPILER ERROR at PC126: Overwrote pending register: R18 in 'AssignReg'

      -- DECOMPILER ERROR at PC127: Overwrote pending register: R19 in 'AssignReg'

      -- DECOMPILER ERROR at PC128: Overwrote pending register: R20 in 'AssignReg'

      -- DECOMPILER ERROR at PC129: No list found for R8 , SetList fails

      -- DECOMPILER ERROR at PC139: Overwrote pending register: R18 in 'AssignReg'

      -- DECOMPILER ERROR at PC142: Overwrote pending register: R11 in 'AssignReg'

      -- DECOMPILER ERROR at PC143: Overwrote pending register: R12 in 'AssignReg'

      -- DECOMPILER ERROR at PC144: Overwrote pending register: R13 in 'AssignReg'

      -- DECOMPILER ERROR at PC145: Overwrote pending register: R14 in 'AssignReg'

      -- DECOMPILER ERROR at PC146: Overwrote pending register: R15 in 'AssignReg'

      -- DECOMPILER ERROR at PC147: Overwrote pending register: R16 in 'AssignReg'

      -- DECOMPILER ERROR at PC148: Overwrote pending register: R17 in 'AssignReg'

      -- DECOMPILER ERROR at PC150: Overwrote pending register: R19 in 'AssignReg'

      -- DECOMPILER ERROR at PC151: Overwrote pending register: R20 in 'AssignReg'

      -- DECOMPILER ERROR at PC152: Overwrote pending register: R21 in 'AssignReg'

      -- DECOMPILER ERROR at PC153: Overwrote pending register: R22 in 'AssignReg'

      -- DECOMPILER ERROR at PC154: Overwrote pending register: R23 in 'AssignReg'

      -- DECOMPILER ERROR at PC158: Overwrote pending register: R12 in 'AssignReg'

      -- DECOMPILER ERROR at PC159: Overwrote pending register: R13 in 'AssignReg'

      -- DECOMPILER ERROR at PC160: Overwrote pending register: R14 in 'AssignReg'

      -- DECOMPILER ERROR at PC161: Overwrote pending register: R15 in 'AssignReg'

      -- DECOMPILER ERROR at PC162: Overwrote pending register: R16 in 'AssignReg'

      -- DECOMPILER ERROR at PC163: Overwrote pending register: R17 in 'AssignReg'

      -- DECOMPILER ERROR at PC168: Overwrote pending register: R13 in 'AssignReg'

      -- DECOMPILER ERROR at PC169: Overwrote pending register: R14 in 'AssignReg'

      -- DECOMPILER ERROR at PC170: Overwrote pending register: R15 in 'AssignReg'

      -- DECOMPILER ERROR at PC171: Overwrote pending register: R16 in 'AssignReg'

      -- DECOMPILER ERROR at PC172: Overwrote pending register: R17 in 'AssignReg'

      -- DECOMPILER ERROR at PC181: Overwrote pending register: R14 in 'AssignReg'

      -- DECOMPILER ERROR at PC182: Overwrote pending register: R15 in 'AssignReg'

      -- DECOMPILER ERROR at PC183: Overwrote pending register: R16 in 'AssignReg'

      -- DECOMPILER ERROR at PC184: Overwrote pending register: R17 in 'AssignReg'

      local l_0_23 = "save returned"
      local l_0_24 = "handshake"
      local l_0_25 = "beacon"
      local l_0_26 = "check%s?in"
      local l_0_27 = "callback"
      local l_0_28 = {}
      -- DECOMPILER ERROR at PC194: No list found for R23 , SetList fails

      -- DECOMPILER ERROR at PC197: Overwrote pending register: R15 in 'AssignReg'

      -- DECOMPILER ERROR at PC198: Overwrote pending register: R16 in 'AssignReg'

      -- DECOMPILER ERROR at PC199: Overwrote pending register: R17 in 'AssignReg'

      -- DECOMPILER ERROR at PC206: Overwrote pending register: R24 in 'AssignReg'

      -- DECOMPILER ERROR at PC207: Overwrote pending register: R25 in 'AssignReg'

      -- DECOMPILER ERROR at PC208: Overwrote pending register: R26 in 'AssignReg'

      l_0_28 = {"wait ", "for a response", 40}
      -- DECOMPILER ERROR at PC216: Overwrote pending register: R16 in 'AssignReg'

      -- DECOMPILER ERROR at PC217: Overwrote pending register: R17 in 'AssignReg'

      -- DECOMPILER ERROR at PC218: Overwrote pending register: R18 in 'AssignReg'

      -- DECOMPILER ERROR at PC219: Overwrote pending register: R19 in 'AssignReg'

      -- DECOMPILER ERROR at PC220: Overwrote pending register: R20 in 'AssignReg'

      -- DECOMPILER ERROR at PC221: Overwrote pending register: R21 in 'AssignReg'

      -- DECOMPILER ERROR at PC222: Overwrote pending register: R22 in 'AssignReg'

      l_0_28 = "insufficient privileges"
      -- DECOMPILER ERROR at PC226: Overwrote pending register: R17 in 'AssignReg'

      -- DECOMPILER ERROR at PC227: Overwrote pending register: R18 in 'AssignReg'

      -- DECOMPILER ERROR at PC228: Overwrote pending register: R19 in 'AssignReg'

      -- DECOMPILER ERROR at PC229: Overwrote pending register: R20 in 'AssignReg'

      -- DECOMPILER ERROR at PC230: Overwrote pending register: R21 in 'AssignReg'

      -- DECOMPILER ERROR at PC231: Overwrote pending register: R22 in 'AssignReg'

      l_0_28 = "root%-only"
      local l_0_29 = "admin only"
      local l_0_30 = "protected location"
      local l_0_31 = "restricted location"
      local l_0_32 = {}
      -- DECOMPILER ERROR at PC240: No list found for R27 , SetList fails

      local l_0_33 = {}
      -- DECOMPILER ERROR at PC242: Overwrote pending register: R29 in 'AssignReg'

      -- DECOMPILER ERROR at PC243: Overwrote pending register: R30 in 'AssignReg'

      -- DECOMPILER ERROR at PC245: No list found for R28 , SetList fails

      -- DECOMPILER ERROR at PC248: Overwrote pending register: R18 in 'AssignReg'

      -- DECOMPILER ERROR at PC249: Overwrote pending register: R19 in 'AssignReg'

      -- DECOMPILER ERROR at PC250: Overwrote pending register: R20 in 'AssignReg'

      -- DECOMPILER ERROR at PC251: Overwrote pending register: R21 in 'AssignReg'

      -- DECOMPILER ERROR at PC252: Overwrote pending register: R22 in 'AssignReg'

      -- DECOMPILER ERROR at PC259: Overwrote pending register: R29 in 'AssignReg'

      -- DECOMPILER ERROR at PC262: Overwrote pending register: R19 in 'AssignReg'

      -- DECOMPILER ERROR at PC263: Overwrote pending register: R20 in 'AssignReg'

      -- DECOMPILER ERROR at PC264: Overwrote pending register: R21 in 'AssignReg'

      -- DECOMPILER ERROR at PC265: Overwrote pending register: R22 in 'AssignReg'

      -- DECOMPILER ERROR at PC266: Overwrote pending register: R23 in 'AssignReg'

      -- DECOMPILER ERROR at PC267: Overwrote pending register: R24 in 'AssignReg'

      -- DECOMPILER ERROR at PC268: Overwrote pending register: R25 in 'AssignReg'

      -- DECOMPILER ERROR at PC269: Overwrote pending register: R26 in 'AssignReg'

      -- DECOMPILER ERROR at PC270: Overwrote pending register: R27 in 'AssignReg'

      -- DECOMPILER ERROR at PC271: Overwrote pending register: R28 in 'AssignReg'

      -- DECOMPILER ERROR at PC273: Overwrote pending register: R30 in 'AssignReg'

      -- DECOMPILER ERROR at PC274: Overwrote pending register: R31 in 'AssignReg'

      -- DECOMPILER ERROR at PC279: Overwrote pending register: R20 in 'AssignReg'

      -- DECOMPILER ERROR at PC280: Overwrote pending register: R21 in 'AssignReg'

      -- DECOMPILER ERROR at PC281: Overwrote pending register: R22 in 'AssignReg'

      -- DECOMPILER ERROR at PC282: Overwrote pending register: R23 in 'AssignReg'

      -- DECOMPILER ERROR at PC283: Overwrote pending register: R24 in 'AssignReg'

      -- DECOMPILER ERROR at PC284: Overwrote pending register: R25 in 'AssignReg'

      -- DECOMPILER ERROR at PC285: Overwrote pending register: R26 in 'AssignReg'

      -- DECOMPILER ERROR at PC286: Overwrote pending register: R27 in 'AssignReg'

      -- DECOMPILER ERROR at PC287: Overwrote pending register: R28 in 'AssignReg'

      -- DECOMPILER ERROR at PC298: Overwrote pending register: R21 in 'AssignReg'

      -- DECOMPILER ERROR at PC299: Overwrote pending register: R22 in 'AssignReg'

      -- DECOMPILER ERROR at PC300: Overwrote pending register: R23 in 'AssignReg'

      -- DECOMPILER ERROR at PC301: Overwrote pending register: R24 in 'AssignReg'

      -- DECOMPILER ERROR at PC303: Overwrote pending register: R26 in 'AssignReg'

      -- DECOMPILER ERROR at PC304: Overwrote pending register: R27 in 'AssignReg'

      -- DECOMPILER ERROR at PC305: Overwrote pending register: R28 in 'AssignReg'

      -- DECOMPILER ERROR at PC307: Overwrote pending register: R26 in 'AssignReg'

      -- DECOMPILER ERROR at PC308: Overwrote pending register: R27 in 'AssignReg'

      -- DECOMPILER ERROR at PC309: Overwrote pending register: R28 in 'AssignReg'

      l_0_30 = {l_0_31, l_0_32, l_0_33}
      -- DECOMPILER ERROR at PC317: Overwrote pending register: R22 in 'AssignReg'

      -- DECOMPILER ERROR at PC318: Overwrote pending register: R23 in 'AssignReg'

      -- DECOMPILER ERROR at PC319: Overwrote pending register: R24 in 'AssignReg'

      l_0_30 = "%.ini%f[%W]"
      -- DECOMPILER ERROR at PC321: Overwrote pending register: R26 in 'AssignReg'

      -- DECOMPILER ERROR at PC322: Overwrote pending register: R27 in 'AssignReg'

      -- DECOMPILER ERROR at PC323: Overwrote pending register: R28 in 'AssignReg'

      -- DECOMPILER ERROR at PC329: Overwrote pending register: R23 in 'AssignReg'

      -- DECOMPILER ERROR at PC330: Overwrote pending register: R24 in 'AssignReg'

      l_0_30 = "%f[%w]tcpdump%f[%W]"
      -- DECOMPILER ERROR at PC332: Overwrote pending register: R26 in 'AssignReg'

      -- DECOMPILER ERROR at PC333: Overwrote pending register: R27 in 'AssignReg'

      -- DECOMPILER ERROR at PC334: Overwrote pending register: R28 in 'AssignReg'

      -- DECOMPILER ERROR at PC339: Overwrote pending register: R24 in 'AssignReg'

      l_0_30 = "%.pcap"
      -- DECOMPILER ERROR at PC341: Overwrote pending register: R26 in 'AssignReg'

      -- DECOMPILER ERROR at PC342: Overwrote pending register: R27 in 'AssignReg'

      -- DECOMPILER ERROR at PC343: Overwrote pending register: R28 in 'AssignReg'

      l_0_30 = "connection attempt"
      -- DECOMPILER ERROR at PC347: Overwrote pending register: R26 in 'AssignReg'

      -- DECOMPILER ERROR at PC348: Overwrote pending register: R27 in 'AssignReg'

      -- DECOMPILER ERROR at PC349: Overwrote pending register: R28 in 'AssignReg'

      -- DECOMPILER ERROR at PC354: Overwrote pending register: R26 in 'AssignReg'

      -- DECOMPILER ERROR at PC355: Overwrote pending register: R27 in 'AssignReg'

      -- DECOMPILER ERROR at PC356: Overwrote pending register: R28 in 'AssignReg'

      -- DECOMPILER ERROR at PC366: Overwrote pending register: R27 in 'AssignReg'

      -- DECOMPILER ERROR at PC367: Overwrote pending register: R28 in 'AssignReg'

      -- DECOMPILER ERROR at PC377: Overwrote pending register: R28 in 'AssignReg'

      local l_0_34 = "%f[%w]schtasks%f[%W]"
      local l_0_35 = "register%-scheduledtask"
      local l_0_36 = "task scheduler"
      local l_0_37 = "%f[%w]cron%f[%W]"
      local l_0_38 = "%f[%w]crontab%f[%W]"
      local l_0_39 = "%f[%w]launchd%f[%W]"
      local l_0_40 = {}
      -- DECOMPILER ERROR at PC388: No list found for R35 , SetList fails

      -- DECOMPILER ERROR at PC389: Overwrote pending register: R36 in 'AssignReg'

      -- DECOMPILER ERROR at PC400: Overwrote pending register: R37 in 'AssignReg'

      -- DECOMPILER ERROR at PC403: Overwrote pending register: R30 in 'AssignReg'

      -- DECOMPILER ERROR at PC404: Overwrote pending register: R31 in 'AssignReg'

      -- DECOMPILER ERROR at PC405: Overwrote pending register: R32 in 'AssignReg'

      -- DECOMPILER ERROR at PC406: Overwrote pending register: R33 in 'AssignReg'

      -- DECOMPILER ERROR at PC407: Overwrote pending register: R34 in 'AssignReg'

      -- DECOMPILER ERROR at PC408: Overwrote pending register: R35 in 'AssignReg'

      -- DECOMPILER ERROR at PC411: Overwrote pending register: R38 in 'AssignReg'

      -- DECOMPILER ERROR at PC425: Overwrote pending register: R32 in 'AssignReg'

      -- DECOMPILER ERROR at PC426: Overwrote pending register: R33 in 'AssignReg'

      -- DECOMPILER ERROR at PC427: Overwrote pending register: R34 in 'AssignReg'

      -- DECOMPILER ERROR at PC430: Overwrote pending register: R33 in 'AssignReg'

      -- DECOMPILER ERROR at PC431: Overwrote pending register: R34 in 'AssignReg'

      -- DECOMPILER ERROR at PC432: Overwrote pending register: R35 in 'AssignReg'

      -- DECOMPILER ERROR at PC435: Overwrote pending register: R34 in 'AssignReg'

      -- DECOMPILER ERROR at PC436: Overwrote pending register: R35 in 'AssignReg'

      -- DECOMPILER ERROR at PC440: Overwrote pending register: R35 in 'AssignReg'

      -- DECOMPILER ERROR at PC444: Overwrote pending register: R35 in 'AssignReg'

      l_0_39, l_0_38, l_0_37, l_0_36 = {l_0_40, "fallback", 40}, {l_0_39, l_0_40, 40}, {l_0_38, l_0_39, l_0_40}, {l_0_37, l_0_38, l_0_39}
      l_0_36 = function(l_1_0, l_1_1)
  -- function num : 0_0
  local l_1_2 = {}
  l_1_2.min = l_1_1
  for l_1_6 = 1, #l_1_0 do
    l_1_2[l_1_6] = l_1_0[l_1_6]
  end
  return l_1_2
end

      l_0_37 = function(l_2_0, l_2_1, l_2_2)
  -- function num : 0_1
  local l_2_3 = string.find
  local l_2_4 = l_2_0
  local l_2_5 = l_2_1
  do
    local l_2_6 = l_2_2
    do return l_2_3(l_2_4, l_2_5, l_2_6) end
    -- DECOMPILER ERROR at PC7: Confused about usage of register R4 for local variables in 'ReleaseLocals'

  end
end

      l_0_38 = 900
      l_0_39 = 32
      -- DECOMPILER ERROR at PC466: Overwrote pending register: R35 in 'AssignReg'

      local l_0_41 = {}
      local l_0_43 = function(l_4_0)
  -- function num : 0_3 , upvalues : l_0_41, l_0_40, l_0_11
  do
    if l_0_41[l_4_0] == nil then
      local l_4_1, l_4_2 = l_0_40(l_0_11, l_4_0)
      l_4_2 = l_0_41
      l_4_2[l_4_0] = l_4_1
    end
    -- DECOMPILER ERROR at PC11: Confused about usage of register: R1 in 'UnsetPending'

    return l_4_1
  end
end

      local l_0_44 = function(l_5_0, l_5_1, l_5_2, l_5_3)
  -- function num : 0_4
  local l_5_4 = {}
  local l_5_5 = 0
  for l_5_9 = 1, #l_5_0 do
    local l_5_10 = l_5_0[l_5_9]
    if l_5_2 <= l_5_10[1] and l_5_10[1] <= l_5_3 and l_5_4[l_5_10[2]] == nil then
      l_5_4[l_5_10[2]] = true
      l_5_5 = l_5_5 + 1
      if l_5_1 <= l_5_5 then
        return l_5_10[3]
      end
    end
  end
  return nil
end

      local l_0_45 = false
      if #l_0_43(l_0_34) == 0 then
        return mp.CLEAN
      end
      if #l_0_43(l_0_35) == 0 then
        return mp.CLEAN
      end
      local l_0_47 = false
      local l_0_48 = function(l_6_0)
  -- function num : 0_5 , upvalues : l_0_44, l_0_45
  if l_0_44 then
    return l_0_45
  end
  l_0_44 = true
  for l_6_4,l_6_5,l_6_6,l_6_7 in (string.gmatch)(l_6_0, "%f[%d](%d%d?%d?)%.(%d%d?%d?)%.(%d%d?%d?)%.(%d%d?%d?)%f[%D]") do
    local l_6_8 = tonumber(l_6_4)
    local l_6_9 = tonumber(l_6_5)
    local l_6_10 = tonumber(l_6_6)
    local l_6_11 = tonumber(l_6_7)
    if ((l_6_8 == nil or l_6_9 == nil or l_6_10 == nil or l_6_11 == nil or l_6_8 <= 0 or l_6_8 >= 224 or l_6_9 >= 256 or l_6_10 >= 256 or l_6_11 >= 256 or l_6_8 == 10 or l_6_8 == 127 or (l_6_8 == 192 and l_6_9 == 168) or (l_6_8 == 172 and l_6_9 >= 16 and l_6_9 <= 31) or (l_6_8 == 169 and l_6_9 == 254) or (l_6_8 ~= 100 or l_6_9 < 64 or l_6_9 > 127))) then
      l_0_45 = true
      return true
    end
  end
  return false
end

      local l_0_49 = {}
      local l_0_50 = {id = "CredentialHarvestAndExfil"}
      l_0_50.groups = {l_0_12, l_0_13, l_0_14, l_0_15, l_0_34, l_0_35}
      local l_0_51 = {id = "TrafficCaptureOfOwnEgress"}
      l_0_51.groups = {l_0_27, l_0_28, l_0_29, l_0_34, l_0_35}
      l_0_51.needExternalIp = true
      local l_0_52 = {id = "StartupPersistenceWithBeacon"}
      l_0_52.groups = {l_0_30, l_0_31, l_0_16, l_0_34, l_0_35}
      local l_0_53 = {id = "ScheduledTaskPersistenceElevated"}
      l_0_53.groups = {l_0_32, l_0_33, l_0_19, l_0_21, l_0_34, l_0_35}
      local l_0_54 = {id = "PrivilegeEscalationToProtectedResource"}
      l_0_54.groups = {l_0_19, l_0_20, l_0_21, l_0_22, l_0_34, l_0_35}
      local l_0_55 = {id = "SecurityControlTamper"}
      l_0_55.groups = {l_0_36(l_0_23, 2), l_0_24, l_0_25, l_0_26, l_0_34, l_0_35}
      local l_0_56 = {id = "RawSocketC2Channel"}
      l_0_56.groups = {l_0_16, l_0_17, l_0_18, l_0_34, l_0_35}
      l_0_56.needExternalIp = true
      -- DECOMPILER ERROR at PC605: No list found for R42 , SetList fails

      l_0_50, l_0_51 = nil
      l_0_52 = 1
      l_0_53 = #l_0_49
      l_0_54 = 1
      for l_0_55 = l_0_52, l_0_53, l_0_54 do
        l_0_56 = l_0_49[l_0_55]
        local l_0_57 = l_0_56.groups
        local l_0_58 = {}
        local l_0_59 = {}
        for l_0_63 = 1, #l_0_57 do
          local l_0_60, l_0_61 = 0, true
          -- DECOMPILER ERROR at PC623: Confused about usage of register: R58 in 'UnsetPending'

          if #l_0_43(l_0_57[R58_PC623]) == 0 then
            l_0_61 = false
            break
          end
          l_0_58[R58_PC623] = l_0_43(l_0_57[R58_PC623])
          for l_0_68 = 1, #l_0_43(l_0_57[R58_PC623]) do
            local l_0_66 = nil
            l_0_60 = l_0_60 + 1
            -- DECOMPILER ERROR at PC638: Confused about usage of register: R63 in 'UnsetPending'

            l_0_59[l_0_60] = (l_0_66[R63_PC638])[1]
          end
        end
        do
          do
            -- DECOMPILER ERROR at PC644: Confused about usage of register: R54 in 'UnsetPending'

            -- DECOMPILER ERROR at PC659: Confused about usage of register: R53 in 'UnsetPending'

            if not l_0_61 or not l_0_56.needExternalIp or l_0_48(l_0_11) or false then
              for l_0_72 = 1, l_0_60 do
                local l_0_69, l_0_70 = nil
                -- DECOMPILER ERROR at PC662: Confused about usage of register: R58 in 'UnsetPending'

                local l_0_75 = nil
                local l_0_76 = l_0_59[l_0_65] + l_0_38
                for l_0_80 = 1, #l_0_57 do
                  local l_0_77, l_0_78 = {}, true
                  -- DECOMPILER ERROR at PC671: Confused about usage of register: R66 in 'UnsetPending'

                  if (l_0_44(l_0_58[R66_PC671], (l_0_57[R66_PC671]).min or 1, l_0_75, l_0_76)) == nil then
                    l_0_78 = false
                    break
                  end
                  l_0_77[#l_0_77 + 1] = (l_0_44(l_0_58[R66_PC671], (l_0_57[R66_PC671]).min or 1, l_0_75, l_0_76))
                end
                do
                  -- DECOMPILER ERROR at PC691: Confused about usage of register: R62 in 'UnsetPending'

                  if l_0_78 then
                    do
                      do
                        l_0_50 = l_0_56.id
                        -- DECOMPILER ERROR at PC695: Confused about usage of register: R61 in 'UnsetPending'

                        l_0_51 = l_0_77
                        do break end
                        -- DECOMPILER ERROR at PC697: LeaveBlock: unexpected jumping out DO_STMT

                        -- DECOMPILER ERROR at PC697: LeaveBlock: unexpected jumping out IF_THEN_STMT

                        -- DECOMPILER ERROR at PC697: LeaveBlock: unexpected jumping out IF_STMT

                        -- DECOMPILER ERROR at PC697: LeaveBlock: unexpected jumping out DO_STMT

                      end
                    end
                  end
                end
              end
            end
            if l_0_50 ~= nil then
              break
            end
            -- DECOMPILER ERROR at PC702: LeaveBlock: unexpected jumping out DO_STMT

            -- DECOMPILER ERROR at PC702: LeaveBlock: unexpected jumping out DO_STMT

          end
        end
      end
      if l_0_50 == nil then
        return mp.CLEAN
      end
      if (safeJsonSerialize({Rule = l_0_50, AgentSessionId = tostring((mp.get_contextdata)(mp.CONTEXT_NAME_PROMPT_AGENT_SESSIONID) or ""), LastMessage = tostring((MpCommon.Base64Encode)((string.sub)(l_0_56, 1, l_0_2)) or ""), Framework = tostring((mp.get_contextdata)(mp.CONTEXT_DATA_NET_PROMPT_FRAMEWORK) or ""), BufferLen = tostring(#l_0_4), MatchedPatterns = (table.concat)(l_0_51, "|")})) ~= nil and 0 < #(safeJsonSerialize({Rule = l_0_50, AgentSessionId = tostring((mp.get_contextdata)(mp.CONTEXT_NAME_PROMPT_AGENT_SESSIONID) or ""), LastMessage = tostring((MpCommon.Base64Encode)((string.sub)(l_0_56, 1, l_0_2)) or ""), Framework = tostring((mp.get_contextdata)(mp.CONTEXT_DATA_NET_PROMPT_FRAMEWORK) or ""), BufferLen = tostring(#l_0_4), MatchedPatterns = (table.concat)(l_0_51, "|")})) then
        (mp.SetDetectionString)((safeJsonSerialize({Rule = l_0_50, AgentSessionId = tostring((mp.get_contextdata)(mp.CONTEXT_NAME_PROMPT_AGENT_SESSIONID) or ""), LastMessage = tostring((MpCommon.Base64Encode)((string.sub)(l_0_56, 1, l_0_2)) or ""), Framework = tostring((mp.get_contextdata)(mp.CONTEXT_DATA_NET_PROMPT_FRAMEWORK) or ""), BufferLen = tostring(#l_0_4), MatchedPatterns = (table.concat)(l_0_51, "|")})))
      end
      do return mp.INFECTED end
      -- DECOMPILER ERROR at PC787: Confused about usage of register R49 for local variables in 'ReleaseLocals'

    end
  end
end

