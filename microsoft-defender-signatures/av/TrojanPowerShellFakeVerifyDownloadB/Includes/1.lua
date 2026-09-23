-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\TrojanPowerShellFakeVerifyDownloadB\Includes\1.luac 

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
      if not (string.find)(l_0_6, "irm ", 1, true) and not (string.find)(l_0_6, "irm(", 1, true) then
        local l_0_8 = nil
      end
      local l_0_9 = nil
      -- DECOMPILER ERROR at PC185: Overwrote pending register: R7 in 'AssignReg'

      do
        if (not l_0_9 or not ((string.find)(l_0_6, "invoke-restmethod", 1, true)) or not (string.find)(l_0_6, ".trycloudflare.com/api/loader/bootstrap/", 1, true) or not (string.find)(l_0_6, "iwr ", 1, true)) and not (string.find)(l_0_6, "iwr(", 1, true) then
          local l_0_10, l_0_14, l_0_18, l_0_19, l_0_23, l_0_24, l_0_25 = , nil, (string.find)(l_0_6, "invoke-webrequest", 1, true)
        end
        do
          if not (string.find)(l_0_6, "-w h", 1, true) then
            local l_0_11, l_0_15, l_0_20, l_0_26 = , (string.find)(l_0_6, "-windowstyle hidden", 1, true)
          end
          do
            if not (string.find)(l_0_6, "-ep bypass", 1, true) then
              local l_0_12, l_0_16, l_0_21, l_0_27 = nil
            end
            do
              if not (string.find)(l_0_6, "i am not a robot", 1, true) then
                local l_0_13, l_0_17, l_0_22, l_0_28 = nil
              end
              -- DECOMPILER ERROR at PC259: Confused about usage of register: R7 in 'UnsetPending'

              -- DECOMPILER ERROR at PC263: Confused about usage of register: R8 in 'UnsetPending'

              -- DECOMPILER ERROR at PC265: Confused about usage of register: R9 in 'UnsetPending'

              -- DECOMPILER ERROR at PC310: Confused about usage of register: R8 in 'UnsetPending'

              do
                -- DECOMPILER ERROR at PC365: Unhandled construct in 'MakeBoolean' P3

                -- DECOMPILER ERROR at PC365: Unhandled construct in 'MakeBoolean' P3

                -- DECOMPILER ERROR at PC365: Unhandled construct in 'MakeBoolean' P3

                -- DECOMPILER ERROR at PC365: Unhandled construct in 'MakeBoolean' P3

                -- DECOMPILER ERROR at PC365: Unhandled construct in 'MakeBoolean' P3

                -- DECOMPILER ERROR at PC365: Unhandled construct in 'MakeBoolean' P3

                -- DECOMPILER ERROR at PC365: Unhandled construct in 'MakeBoolean' P3

                -- DECOMPILER ERROR at PC365: Unhandled construct in 'MakeBoolean' P3

                -- DECOMPILER ERROR at PC365: Unhandled construct in 'MakeBoolean' P3

                -- DECOMPILER ERROR at PC365: Unhandled construct in 'MakeBoolean' P3

                if ((l_0_17 ~= nil or not l_0_9 or not l_0_22 or not l_0_28 or not (string.find)(l_0_6, "-executionpolicy bypass", 1, true) or not (string.find)(l_0_6, "no soy un robot", 1, true) or not (string.find)(l_0_6, "cloudflare id:", 1, true) or "hidden_bypass" == nil) and "base64" ~= nil) or not (string.find)(l_0_6, "& $", 1, true) then
                  local l_0_29 = nil
                end
                -- DECOMPILER ERROR at PC369: Confused about usage of register: R8 in 'UnsetPending'

                do
                  if "download_file" ~= nil or not (string.find)(l_0_6, "no soy un robot", 1, true) or not l_0_22 or not (string.find)(l_0_6, "cloudflare id:", 1, true) or not (string.find)(l_0_6, "-bxor", 1, true) or not (string.find)(l_0_6, "[convert]::toint32", 1, true) or not (string.find)(l_0_6, "saps conhost", 1, true) then
                    local l_0_30 = nil
                  end
                  -- DECOMPILER ERROR at PC412: Confused about usage of register: R8 in 'UnsetPending'

                  if "bxor" ~= nil or not (string.find)(l_0_6, "start-process conhost", 1, true) or not l_0_22 or not (string.find)(l_0_6, "-headless", 1, true) or not (string.find)(l_0_6, "powershell", 1, true) or not (string.find)(l_0_6, "starting cloudflare verification", 1, true) or "headless_conhost" == nil then
                    return mp.CLEAN
                  end
                  local l_0_31 = nil
                  local l_0_32, l_0_33, l_0_34, l_0_35, l_0_36 = nil
                  if not FindRollingQueueContentMatch({"IsClickFixCMD", "IsClickFixCMD_Malicious"}, l_0_3) then
                    return mp.CLEAN
                  end
                  local l_0_37 = nil
                  local l_0_38 = nil
                  local l_0_39 = nil
                  local l_0_40 = nil
                  local l_0_41 = nil
                  local l_0_42 = nil
                  local l_0_43 = nil
                  local l_0_44 = nil
                  do
                    -- DECOMPILER ERROR at PC503: Overwrote pending register: R23 in 'AssignReg'

                    set_research_data("FakeVerifyDownload_B", R23_PC466, false)
                    do return mp.INFECTED end
                    -- DECOMPILER ERROR at PC509: freeLocal<0 in 'ReleaseLocals'

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

