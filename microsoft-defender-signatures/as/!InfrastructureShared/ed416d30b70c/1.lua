-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\ed416d30b70c\1.luac 

-- params : ...
-- function num : 0
if not IsDeviceHVA() then
  return mp.CLEAN
end
local l_0_0 = (nri.GetRawRequestBlob)()
if isnull(l_0_0) then
  return mp.CLEAN
end
local l_0_1 = (string.lower)(l_0_0)
local l_0_2 = (string.find)(l_0_1, "<rsp:command>", 1, true)
if l_0_2 == nil then
  return mp.CLEAN
end
local l_0_3 = l_0_2 + 13
local l_0_4 = (string.find)(l_0_1, "</rsp:command>", l_0_3, true)
if l_0_4 == nil then
  return mp.CLEAN
end
local l_0_5 = (string.sub)(l_0_1, l_0_3, l_0_4 - 1)
local l_0_6 = false
if (string.find)(l_0_5, "powershell", 1, true) and ((string.find)(l_0_5, "-enc", 1, true) or (string.find)(l_0_5, "encodedcommand", 1, true)) then
  l_0_6 = true
end
-- DECOMPILER ERROR at PC138: Unhandled construct in 'MakeBoolean' P3

-- DECOMPILER ERROR at PC138: Unhandled construct in 'MakeBoolean' P3

if ((string.find)(l_0_5, "certutil", 1, true) and (string.find)(l_0_5, "-urlcache", 1, true)) or not (string.find)(l_0_5, "bitsadmin", 1, true) or (string.find)(l_0_5, "downloadfile", 1, true) then
  l_0_6 = true
end
if not l_0_6 and ((string.find)(l_0_5, "sekurlsa", 1, true) or (string.find)(l_0_5, "invoke-mimikatz", 1, true) or not (string.find)(l_0_5, "comsvcs", 1, true) or (string.find)(l_0_5, "minidump", 1, true)) then
  l_0_6 = true
end
if ((string.find)(l_0_5, "vssadmin", 1, true) and (string.find)(l_0_5, "delete", 1, true)) or (string.find)(l_0_5, "wevtutil", 1, true) and (string.find)(l_0_5, " cl ", 1, true) then
  l_0_6 = true
end
if not l_0_6 then
  local l_0_7 = (string.find)(l_0_1, "<rsp:arguments>", 1, true)
  if l_0_7 ~= nil then
    local l_0_8 = l_0_7 + 15
    local l_0_9 = (string.find)(l_0_1, "</rsp:arguments>", l_0_8, true)
    if l_0_9 ~= nil then
      local l_0_10 = (string.sub)(l_0_0, l_0_8, l_0_9 - 1)
      do
        local l_0_11, l_0_12 = (string.match)(l_0_10, "^%s*(.-)%s*$") or ""
        -- DECOMPILER ERROR at PC252: Confused about usage of register: R11 in 'UnsetPending'

        -- DECOMPILER ERROR at PC258: Confused about usage of register: R11 in 'UnsetPending'

        if #l_0_11 > 4 then
          local l_0_13, l_0_14 = , pcall(MpCommon.Base64Decode, l_0_11)
          if l_0_14 and MpCommon.Base64Decode ~= nil then
            local l_0_15 = nil
            -- DECOMPILER ERROR at PC269: Overwrote pending register: R15 in 'AssignReg'

            R15_PC267 = R15_PC267((string.lower)(R15_PC267), "invoke-expression", 1, true)
            if not R15_PC267 then
              R15_PC267 = string
              R15_PC267 = R15_PC267.find
              R15_PC267 = R15_PC267((string.lower)(R15_PC267), "invoke-mimikatz", 1, true)
              if not R15_PC267 then
                R15_PC267 = string
                R15_PC267 = R15_PC267.find
                R15_PC267 = R15_PC267((string.lower)(R15_PC267), "frombase64string", 1, true)
                if not R15_PC267 then
                  R15_PC267 = string
                  R15_PC267 = R15_PC267.find
                  R15_PC267 = R15_PC267((string.lower)(R15_PC267), "amsiutils", 1, true)
                  if not R15_PC267 then
                    R15_PC267 = string
                    R15_PC267 = R15_PC267.find
                    R15_PC267 = R15_PC267((string.lower)(R15_PC267), "net.webclient", 1, true)
                    if not R15_PC267 then
                      R15_PC267 = string
                      R15_PC267 = R15_PC267.find
                      R15_PC267 = R15_PC267((string.lower)(R15_PC267), "set-mppreference", 1, true)
                      if not R15_PC267 then
                        R15_PC267 = string
                        R15_PC267 = R15_PC267.find
                        R15_PC267 = R15_PC267((string.lower)(R15_PC267), "downloadstring", 1, true)
                      end
                    end
                  end
                end
              end
            end
            if R15_PC267 then
              l_0_6 = true
            end
          end
        end
        do
          if not l_0_6 then
            return mp.CLEAN
          end
          ;
          (nri.AddTelemetry)((mp.bitor)(nri.Telemetry_HOSTNAME, nri.Telemetry_PATH))
          local l_0_16 = reportHeaders
          do
            local l_0_17 = {}
            -- DECOMPILER ERROR at PC351: No list found for R8 , SetList fails

            l_0_16(l_0_17)
            -- DECOMPILER ERROR at PC354: Overwrote pending register: R7 in 'AssignReg'

            do return l_0_16 end
            -- WARNING: undefined locals caused missing assignments!
          end
        end
      end
    end
  end
end

