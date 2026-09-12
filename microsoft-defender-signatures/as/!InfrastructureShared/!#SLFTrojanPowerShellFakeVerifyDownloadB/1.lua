-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#SLFTrojanPowerShellFakeVerifyDownloadB\1.luac 

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
      local l_0_7, l_0_8, l_0_14, l_0_15, l_0_21, l_0_24, l_0_30, l_0_33 = (string.find)(l_0_6, "invoke-expression", 1, true)
    end
    do
      if not (string.find)(l_0_6, "irm ", 1, true) and not (string.find)(l_0_6, "irm(", 1, true) then
        local l_0_9, l_0_16, l_0_22, l_0_25, l_0_31, l_0_34 = , (string.find)(l_0_6, "invoke-restmethod", 1, true)
      end
      -- DECOMPILER ERROR at PC171: Confused about usage of register: R5 in 'UnsetPending'

      -- DECOMPILER ERROR at PC173: Confused about usage of register: R6 in 'UnsetPending'

      if l_0_9 and l_0_16 and (string.find)(l_0_6, ".trycloudflare.com/api/loader/bootstrap/", 1, true) then
        return mp.INFECTED
      end
      do
        if not (string.find)(l_0_6, "iwr ", 1, true) and not (string.find)(l_0_6, "iwr(", 1, true) then
          local l_0_10, l_0_17, l_0_23, l_0_26, l_0_32, l_0_35 = , (string.find)(l_0_6, "invoke-webrequest", 1, true)
        end
        do
          if not (string.find)(l_0_6, "-w h", 1, true) then
            local l_0_11, l_0_18, l_0_27 = nil
          end
          do
            if not (string.find)(l_0_6, "-ep bypass", 1, true) then
              local l_0_12, l_0_19, l_0_28 = nil
            end
            do
              if not (string.find)(l_0_6, "i am not a robot", 1, true) then
                local l_0_13, l_0_20, l_0_29 = nil
              end
              -- DECOMPILER ERROR at PC260: Confused about usage of register: R5 in 'UnsetPending'

              -- DECOMPILER ERROR at PC262: Confused about usage of register: R7 in 'UnsetPending'

              if l_0_13 and l_0_29 and (string.find)(l_0_6, "-windowstyle hidden", 1, true) and (string.find)(l_0_6, "-executionpolicy bypass", 1, true) and (string.find)(l_0_6, "no soy un robot", 1, true) and (string.find)(l_0_6, "cloudflare id:", 1, true) then
                return mp.INFECTED
              end
              -- DECOMPILER ERROR at PC284: Confused about usage of register: R5 in 'UnsetPending'

              if (string.find)(l_0_6, "no soy un robot", 1, true) and l_0_13 and (string.find)(l_0_6, "cloudflare id:", 1, true) and (string.find)(l_0_6, "frombase64string", 1, true) then
                return mp.INFECTED
              end
              -- DECOMPILER ERROR at PC309: Confused about usage of register: R7 in 'UnsetPending'

              if (string.find)(l_0_6, "no soy un robot", 1, true) and l_0_29 and (string.find)(l_0_6, "cloudflare id:", 1, true) and (string.find)(l_0_6, "-outfile", 1, true) and (string.find)(l_0_6, "powershell", 1, true) and (string.find)(l_0_6, "-file", 1, true) then
                return mp.INFECTED
              end
              -- DECOMPILER ERROR at PC368: Confused about usage of register: R7 in 'UnsetPending'

              if ((string.find)(l_0_6, "& $", 1, true) or (string.find)(l_0_6, "no soy un robot", 1, true)) and l_0_29 and (string.find)(l_0_6, "cloudflare id:", 1, true) and (string.find)(l_0_6, "-bxor", 1, true) and (string.find)(l_0_6, "[convert]::toint32", 1, true) then
                return mp.INFECTED
              end
              -- DECOMPILER ERROR at PC411: Confused about usage of register: R7 in 'UnsetPending'

              if ((string.find)(l_0_6, "saps conhost", 1, true) or (string.find)(l_0_6, "start-process conhost", 1, true)) and l_0_29 and (string.find)(l_0_6, "-headless", 1, true) and (string.find)(l_0_6, "powershell", 1, true) and (string.find)(l_0_6, "starting cloudflare verification", 1, true) then
                return mp.INFECTED
              end
              return mp.CLEAN
            end
          end
        end
      end
    end
  end
end

