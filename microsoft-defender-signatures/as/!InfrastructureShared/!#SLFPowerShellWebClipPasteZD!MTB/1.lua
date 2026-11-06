-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#SLFPowerShellWebClipPasteZD!MTB\1.luac 

-- params : ...
-- function num : 0
if (mp.get_contextdata)(mp.CONTEXT_DATA_SCANREASON) ~= mp.SCANREASON_AMSI then
  return mp.CLEAN
end
local l_0_0 = (mp.getfilesize)()
if l_0_0 == nil or l_0_0 < 32 or l_0_0 > 16384 then
  return mp.CLEAN
end
;
(mp.readprotection)(false)
local l_0_1, l_0_2 = pcall(mp.readfile, 0, l_0_0)
;
(mp.readprotection)(true)
if not l_0_1 or type(l_0_2) ~= "string" or #l_0_2 < 32 then
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
  if #l_0_3 < 32 or #l_0_3 > 16384 then
    return mp.CLEAN
  end
  local l_0_6 = (string.lower)(l_0_3)
  l_0_6 = (string.gsub)(l_0_6, "\\1%s*$", "")
  l_0_6 = (string.gsub)(l_0_6, "%z", "")
  l_0_6 = (string.gsub)(l_0_6, "%^(.)", "%1")
  l_0_6 = (string.gsub)(l_0_6, "`(.)", "%1")
  l_0_6 = (string.gsub)(l_0_6, "%%comspec%%", "cmd.exe")
  l_0_6 = (string.gsub)(l_0_6, "%%localappdata%%", "localappdata")
  l_0_6 = (string.gsub)(l_0_6, "%%temp%%", "temp")
  do
    if not (string.find)(l_0_6, "/v:on", 1, true) and not (string.find)(l_0_6, "/v ", 1, true) then
      local l_0_7 = (string.find)(l_0_6, "/v\t", 1, true)
    end
    do
      if not (string.find)(l_0_6, "&set ", 1, true) and not (string.find)(l_0_6, "& set ", 1, true) and not (string.find)(l_0_6, "(set ", 1, true) and not (string.find)(l_0_6, " set ", 1, true) then
        local l_0_8 = nil
      end
      if not (string.match)(l_0_6, "^set%s+") then
        return mp.CLEAN
      end
      local l_0_9 = nil
      local l_0_10 = nil
      local l_0_12 = {}
      do
        for l_0_16,l_0_17 in (string.gmatch)("&" .. l_0_6, "[&|%(]%s*set%s+[\"\']?([%w_]+)%s*=%s*([^&|\r\n%)]+)") do
          local l_0_13, l_0_14, l_0_15 = function(l_1_0)
  -- function num : 0_0
  l_1_0 = (string.gsub)(l_1_0, "^%s+", "")
  l_1_0 = (string.gsub)(l_1_0, "%s+$", "")
  return l_1_0
end
, function(l_2_0, l_2_1)
  -- function num : 0_1 , upvalues : l_0_r8, l_0_11
  if type(l_2_0) ~= "string" or type(l_2_1) ~= "string" then
    return 
  end
  l_2_0 = (string.lower)(l_0_r8(l_2_0))
  l_2_1 = l_0_r8(l_2_1)
  l_2_1 = (string.gsub)(l_2_1, "^\"", "")
  l_2_1 = (string.gsub)(l_2_1, "\"$", "")
  -- DECOMPILER ERROR at PC46: Confused about usage of register: R2 in 'UnsetPending'

  if #l_2_0 > 0 and #l_2_0 <= 32 and #l_2_1 <= 512 then
    l_0_11[l_2_0] = l_2_1
  end
end

          do
            -- DECOMPILER ERROR at PC233: Confused about usage of register: R14 in 'UnsetPending'

            -- DECOMPILER ERROR at PC234: Confused about usage of register: R15 in 'UnsetPending'

            l_0_14(R14_PC233, R15_PC234)
          end
        end
        for l_0_21,l_0_22 in (string.gmatch)(l_0_6, "set%s+[\"\']?([%w_]+)%s*=%s*([^&|\r\n%)]+)") do
          local l_0_18, l_0_19, l_0_20 = nil
          -- DECOMPILER ERROR at PC246: Confused about usage of register: R14 in 'UnsetPending'

          -- DECOMPILER ERROR at PC252: Confused about usage of register: R14 in 'UnsetPending'

          -- DECOMPILER ERROR at PC253: Confused about usage of register: R15 in 'UnsetPending'

          if l_0_12[(string.lower)(R14_PC233)] == nil then
            l_0_19(R14_PC233, R15_PC234)
          end
        end
        local l_0_23 = nil
        if l_0_9 then
          for l_0_27 = 1, 10 do
            local l_0_24, l_0_25, l_0_26 = , l_0_6
            if not false then
              break
            end
          end
        end
        do
          local l_0_29 = nil
          -- DECOMPILER ERROR at PC323: Confused about usage of register: R11 in 'UnsetPending'

          -- DECOMPILER ERROR at PC332: Confused about usage of register: R11 in 'UnsetPending'

          do
            if not (string.find)((string.gsub)((string.gsub)((string.gsub)((string.gsub)((string.gsub)(l_0_26, "%^", ""), "`", ""), "[\"\']", ""), "[\r\n\t]+", " "), "%s+", " "), "powershell", 1, true) and not (string.find)((string.gsub)((string.gsub)((string.gsub)((string.gsub)((string.gsub)(l_0_26, "%^", ""), "`", ""), "[\"\']", ""), "[\r\n\t]+", " "), "%s+", " "), "powershell.exe", 1, true) then
              local l_0_30 = nil
            end
            -- DECOMPILER ERROR at PC348: Confused about usage of register: R11 in 'UnsetPending'

            -- DECOMPILER ERROR at PC357: Confused about usage of register: R11 in 'UnsetPending'

            do
              if not (string.find)((string.gsub)((string.gsub)((string.gsub)((string.gsub)((string.gsub)(l_0_26, "%^", ""), "`", ""), "[\"\']", ""), "[\r\n\t]+", " "), "%s+", " "), "curl.exe", 1, true) and not (string.find)((string.gsub)((string.gsub)((string.gsub)((string.gsub)((string.gsub)(l_0_26, "%^", ""), "`", ""), "[\"\']", ""), "[\r\n\t]+", " "), "%s+", " "), "curl ", 1, true) then
                local l_0_31 = nil
              end
              -- DECOMPILER ERROR at PC373: Confused about usage of register: R11 in 'UnsetPending'

              -- DECOMPILER ERROR at PC382: Confused about usage of register: R11 in 'UnsetPending'

              do
                if not (string.find)((string.gsub)((string.gsub)((string.gsub)((string.gsub)((string.gsub)(l_0_26, "%^", ""), "`", ""), "[\"\']", ""), "[\r\n\t]+", " "), "%s+", " "), "mshta.exe", 1, true) and not (string.find)((string.gsub)((string.gsub)((string.gsub)((string.gsub)((string.gsub)(l_0_26, "%^", ""), "`", ""), "[\"\']", ""), "[\r\n\t]+", " "), "%s+", " "), "mshta ", 1, true) then
                  local l_0_32 = nil
                end
                if not (string.find)((string.gsub)((string.gsub)((string.gsub)((string.gsub)((string.gsub)((string.gsub)(l_0_26, "%^", ""), "`", ""), "[\"\']", ""), "[\r\n\t]+", " "), "%s+", " "), "[^%w%.:/\\]", ""), "powershell", 1, true) and not (string.find)((string.gsub)((string.gsub)((string.gsub)((string.gsub)((string.gsub)((string.gsub)(l_0_26, "%^", ""), "`", ""), "[\"\']", ""), "[\r\n\t]+", " "), "%s+", " "), "[^%w%.:/\\]", ""), "curl.exe", 1, true) and not (string.find)((string.gsub)((string.gsub)((string.gsub)((string.gsub)((string.gsub)((string.gsub)(l_0_26, "%^", ""), "`", ""), "[\"\']", ""), "[\r\n\t]+", " "), "%s+", " "), "[^%w%.:/\\]", ""), "mshta.exe", 1, true) then
                  return mp.CLEAN
                end
                -- DECOMPILER ERROR at PC407: Confused about usage of register: R11 in 'UnsetPending'

                -- DECOMPILER ERROR at PC416: Confused about usage of register: R11 in 'UnsetPending'

                -- DECOMPILER ERROR at PC425: Confused about usage of register: R11 in 'UnsetPending'

                -- DECOMPILER ERROR at PC434: Confused about usage of register: R11 in 'UnsetPending'

                -- DECOMPILER ERROR at PC443: Confused about usage of register: R11 in 'UnsetPending'

                -- DECOMPILER ERROR at PC452: Confused about usage of register: R11 in 'UnsetPending'

                -- DECOMPILER ERROR at PC461: Confused about usage of register: R11 in 'UnsetPending'

                -- DECOMPILER ERROR at PC470: Confused about usage of register: R11 in 'UnsetPending'

                -- DECOMPILER ERROR at PC479: Confused about usage of register: R11 in 'UnsetPending'

                -- DECOMPILER ERROR at PC488: Confused about usage of register: R11 in 'UnsetPending'

                -- DECOMPILER ERROR at PC497: Confused about usage of register: R11 in 'UnsetPending'

                -- DECOMPILER ERROR at PC506: Confused about usage of register: R11 in 'UnsetPending'

                do
                  if not (string.find)((string.gsub)((string.gsub)((string.gsub)((string.gsub)((string.gsub)(l_0_26, "%^", ""), "`", ""), "[\"\']", ""), "[\r\n\t]+", " "), "%s+", " "), "/c ", 1, true) and not (string.find)((string.gsub)((string.gsub)((string.gsub)((string.gsub)((string.gsub)(l_0_26, "%^", ""), "`", ""), "[\"\']", ""), "[\r\n\t]+", " "), "%s+", " "), "cmd.exe", 1, true) and not (string.find)((string.gsub)((string.gsub)((string.gsub)((string.gsub)((string.gsub)(l_0_26, "%^", ""), "`", ""), "[\"\']", ""), "[\r\n\t]+", " "), "%s+", " "), "conhost", 1, true) and not (string.find)((string.gsub)((string.gsub)((string.gsub)((string.gsub)((string.gsub)(l_0_26, "%^", ""), "`", ""), "[\"\']", ""), "[\r\n\t]+", " "), "%s+", " "), "start ", 1, true) and not (string.find)((string.gsub)((string.gsub)((string.gsub)((string.gsub)((string.gsub)(l_0_26, "%^", ""), "`", ""), "[\"\']", ""), "[\r\n\t]+", " "), "%s+", " "), "pcalua", 1, true) and not (string.find)((string.gsub)((string.gsub)((string.gsub)((string.gsub)((string.gsub)(l_0_26, "%^", ""), "`", ""), "[\"\']", ""), "[\r\n\t]+", " "), "%s+", " "), "-file ", 1, true) and not (string.find)((string.gsub)((string.gsub)((string.gsub)((string.gsub)((string.gsub)(l_0_26, "%^", ""), "`", ""), "[\"\']", ""), "[\r\n\t]+", " "), "%s+", " "), "-ep bypass", 1, true) and not (string.find)((string.gsub)((string.gsub)((string.gsub)((string.gsub)((string.gsub)(l_0_26, "%^", ""), "`", ""), "[\"\']", ""), "[\r\n\t]+", " "), "%s+", " "), "-executionpolicy bypass", 1, true) and not (string.find)((string.gsub)((string.gsub)((string.gsub)((string.gsub)((string.gsub)(l_0_26, "%^", ""), "`", ""), "[\"\']", ""), "[\r\n\t]+", " "), "%s+", " "), "-slo ", 1, true) and not (string.find)((string.gsub)((string.gsub)((string.gsub)((string.gsub)((string.gsub)(l_0_26, "%^", ""), "`", ""), "[\"\']", ""), "[\r\n\t]+", " "), "%s+", " "), "-sklo ", 1, true) and not (string.find)((string.gsub)((string.gsub)((string.gsub)((string.gsub)((string.gsub)(l_0_26, "%^", ""), "`", ""), "[\"\']", ""), "[\r\n\t]+", " "), "%s+", " "), "http://", 1, true) then
                    local l_0_33 = nil
                  end
                  if not (string.find)((string.gsub)((string.gsub)((string.gsub)((string.gsub)((string.gsub)(l_0_26, "%^", ""), "`", ""), "[\"\']", ""), "[\r\n\t]+", " "), "%s+", " "), "https://", 1, true) then
                    return mp.CLEAN
                  end
                  do
                    local l_0_34 = nil
                    if not FindRollingQueueContentMatch({"IsClickFixCMD", "IsClickFixCMD_Malicious"}, l_0_3) then
                      return mp.CLEAN
                    end
                    do return mp.INFECTED end
                    -- DECOMPILER ERROR at PC532: freeLocal<0 in 'ReleaseLocals'

                  end
                end
              end
            end
          end
        end
      end
    end
  end
end

