-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#SLFTrojanPowerShellObfuscatedRemoteExecA\1.luac 

-- params : ...
-- function num : 0
if (mp.get_contextdata)(mp.CONTEXT_DATA_SCANREASON) ~= mp.SCANREASON_AMSI then
  return mp.CLEAN
end
local l_0_0 = (mp.getfilesize)()
if l_0_0 == nil or l_0_0 < 80 or l_0_0 > 8192 then
  return mp.CLEAN
end
;
(mp.readprotection)(false)
local l_0_1, l_0_2 = pcall(mp.readfile, 0, l_0_0)
;
(mp.readprotection)(true)
if not l_0_1 or type(l_0_2) ~= "string" or #l_0_2 < 80 then
  return mp.CLEAN
end
local l_0_3 = l_0_2
do
  if (string.find)((string.sub)(l_0_3, 1, 64), (string.char)(0), 1, true) then
    local l_0_4, l_0_5 = pcall(mp.utf16to8, l_0_3)
    if l_0_4 and type(l_0_5) == "string" and #l_0_5 > 0 then
      l_0_3 = l_0_5
    end
  end
  if #l_0_3 < 80 or #l_0_3 > 8192 then
    return mp.CLEAN
  end
  local l_0_6 = (string.lower)((string.gsub)(l_0_3, "[%^`]", ""))
  do
    if not (string.find)(l_0_6, "iex(", 1, true) and not (string.find)(l_0_6, "iex (", 1, true) and not (string.find)(l_0_6, "|iex", 1, true) and not (string.find)(l_0_6, "| iex", 1, true) then
      local l_0_7 = (string.find)(l_0_6, "invoke-expression", 1, true)
    end
    do
      if not (string.find)(l_0_6, "irm ", 1, true) and not (string.find)(l_0_6, "irm(", 1, true) and not (string.find)(l_0_6, "invoke-restmethod", 1, true) and not (string.find)(l_0_6, "iwr ", 1, true) and not (string.find)(l_0_6, "iwr(", 1, true) and not (string.find)(l_0_6, "invoke-webrequest", 1, true) then
        local l_0_8 = nil
      end
      -- DECOMPILER ERROR at PC207: Confused about usage of register: R5 in 'UnsetPending'

      if not l_0_8 or not (string.find)(l_0_6, "downloadstring(", 1, true) then
        return mp.CLEAN
      end
      do
        if not (string.find)(l_0_6, "((\'htt", 1, true) then
          local l_0_10 = nil
        end
        do
          if ((((((not (string.find)(l_0_6, "(\'htt", 1, true) or (string.find)(l_0_6, "wua/", 1, true)) and (string.find)(l_0_6, "/hex/cloudflare/", 1, true)) or (string.find)(l_0_6, "/cloudflare/", 1, true)) and not (string.find)(l_0_6, ".trycloudflare.com", 1, true)) or (string.find)(l_0_6, "[char[]]", 1, true)) and not (string.find)(l_0_6, "frombase64string", 1, true)) or (string.find)(l_0_6, "-bxor", 1, true) then
            local l_0_9 = nil
          end
          if 0 + 1 + 1 + 1 + 1 + 1 + 1 + 1 < 2 then
            return mp.CLEAN
          end
          local l_0_11 = nil
          local l_0_12, l_0_13, l_0_14, l_0_15, l_0_16 = , FindRollingQueueContentMatch({"IsClickFixCMD", "IsClickFixCMD_Malicious"}, l_0_3)
          if not l_0_16 then
            return mp.CLEAN
          end
          local l_0_17 = nil
          local l_0_18 = nil
          local l_0_19 = nil
          local l_0_20 = nil
          local l_0_21 = tostring(R16_PC323)
          local l_0_22 = R16_PC323
          do
            l_0_21 = l_0_21 .. l_0_22 .. tostring(l_0_17) .. "||" .. (string.sub)(tostring(l_0_19 or "-"), 1, 128) .. "||" .. (string.sub)(tostring(l_0_18), 1, 320) .. "||" .. (string.sub)(tostring(l_0_3), 1, 320)
            -- DECOMPILER ERROR at PC358: Overwrote pending register: R16 in 'AssignReg'

            l_0_22("ObfuscatedRemoteExec_A", l_0_21, false)
            -- DECOMPILER ERROR at PC363: Overwrote pending register: R16 in 'AssignReg'

            -- DECOMPILER ERROR at PC364: Overwrote pending register: R16 in 'AssignReg'

            do return l_0_22 end
            -- DECOMPILER ERROR at PC366: freeLocal<0 in 'ReleaseLocals'

          end
        end
      end
    end
  end
end

