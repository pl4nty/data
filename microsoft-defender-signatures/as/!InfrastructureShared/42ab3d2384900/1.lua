-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\42ab3d2384900\1.luac 

-- params : ...
-- function num : 0
if (((this_sigattrlog[2] ~= nil and (this_sigattrlog[2]).matched) or (this_sigattrlog[3] ~= nil and (this_sigattrlog[3]).matched) or (this_sigattrlog[4] ~= nil and (this_sigattrlog[4]).matched) or IsWinRMSessionForPpid("BM", nil, nil) or not IsWinRMSessionFoundInParents("BM", nil, 4, nil))) then
  return mp.CLEAN
end
local l_0_0, l_0_1 = (bm.get_process_relationships)()
if l_0_1 == nil then
  return mp.CLEAN
end
local l_0_2 = {}
-- DECOMPILER ERROR at PC72: No list found for R2 , SetList fails

local l_0_3 = {}
local l_0_4 = {}
-- DECOMPILER ERROR at PC75: Overwrote pending register: R5 in 'AssignReg'

local l_0_5 = "systeminfo.exe"
-- DECOMPILER ERROR at PC76: Overwrote pending register: R6 in 'AssignReg'

-- DECOMPILER ERROR at PC77: Overwrote pending register: R7 in 'AssignReg'

for l_0_9,l_0_10 in ("hostname.exe")("nltest.exe") do
  -- DECOMPILER ERROR at PC80: Overwrote pending register: R11 in 'AssignReg'

  -- DECOMPILER ERROR at PC88: Overwrote pending register: R12 in 'AssignReg'

  -- DECOMPILER ERROR at PC89: Overwrote pending register: R13 in 'AssignReg'

  if "query.exe" ~= nil and l_0_10.ppid ~= nil then
    local l_0_11 = (mp.bitand)("tasklist.exe", "arp.exe")
    if l_0_11 == l_0_5 then
      local l_0_12 = (string.lower)(l_0_10.image_path)
      -- DECOMPILER ERROR at PC98: Overwrote pending register: R14 in 'AssignReg'

      for l_0_16,l_0_17 in ipairs("nslookup.exe") do
        -- DECOMPILER ERROR at PC101: Overwrote pending register: R18 in 'AssignReg'

        -- DECOMPILER ERROR at PC103: Overwrote pending register: R19 in 'AssignReg'

        -- DECOMPILER ERROR at PC104: Overwrote pending register: R20 in 'AssignReg'

        -- DECOMPILER ERROR at PC105: Overwrote pending register: R21 in 'AssignReg'

        if (("route.exe").find)("wmic.exe", "cmdkey.exe", "klist.exe", true) then
          do
            do
              local l_0_18 = #l_0_3 + 1
              do break end
              -- DECOMPILER ERROR at PC122: LeaveBlock: unexpected jumping out DO_STMT

              -- DECOMPILER ERROR at PC122: LeaveBlock: unexpected jumping out IF_THEN_STMT

              -- DECOMPILER ERROR at PC122: LeaveBlock: unexpected jumping out IF_STMT

            end
          end
        end
      end
      if (string.find)(l_0_12, "\\cmd.exe", 1, true) and l_0_10.cmd_line then
        local l_0_19 = (string.lower)(l_0_10.cmd_line)
        if (string.find)(l_0_19, "whoami", 1, true) then
          local l_0_20 = #l_0_3 + 1
        else
          do
            if (string.find)(l_0_19, "ipconfig", 1, true) then
              local l_0_21 = #l_0_3 + 1
            else
              do
                if (string.find)(l_0_19, "net user", 1, true) or (string.find)(l_0_19, "net group", 1, true) or (string.find)(l_0_19, "net localgroup", 1, true) then
                  local l_0_22 = #l_0_3 + 1
                else
                  do
                    if (string.find)(l_0_19, "systeminfo", 1, true) then
                      local l_0_23 = #l_0_3 + 1
                    else
                      do
                        if (string.find)(l_0_19, "tasklist", 1, true) then
                          local l_0_24 = #l_0_3 + 1
                        else
                          do
                            do
                              if (string.find)(l_0_19, "nltest", 1, true) then
                                local l_0_25 = #l_0_3 + 1
                              end
                              -- DECOMPILER ERROR at PC259: LeaveBlock: unexpected jumping out DO_STMT

                              -- DECOMPILER ERROR at PC259: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                              -- DECOMPILER ERROR at PC259: LeaveBlock: unexpected jumping out IF_STMT

                              -- DECOMPILER ERROR at PC259: LeaveBlock: unexpected jumping out DO_STMT

                              -- DECOMPILER ERROR at PC259: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                              -- DECOMPILER ERROR at PC259: LeaveBlock: unexpected jumping out IF_STMT

                              -- DECOMPILER ERROR at PC259: LeaveBlock: unexpected jumping out DO_STMT

                              -- DECOMPILER ERROR at PC259: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                              -- DECOMPILER ERROR at PC259: LeaveBlock: unexpected jumping out IF_STMT

                              -- DECOMPILER ERROR at PC259: LeaveBlock: unexpected jumping out DO_STMT

                              -- DECOMPILER ERROR at PC259: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                              -- DECOMPILER ERROR at PC259: LeaveBlock: unexpected jumping out IF_STMT

                              -- DECOMPILER ERROR at PC259: LeaveBlock: unexpected jumping out DO_STMT

                              -- DECOMPILER ERROR at PC259: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                              -- DECOMPILER ERROR at PC259: LeaveBlock: unexpected jumping out IF_STMT

                              -- DECOMPILER ERROR at PC259: LeaveBlock: unexpected jumping out IF_THEN_STMT

                              -- DECOMPILER ERROR at PC259: LeaveBlock: unexpected jumping out IF_STMT

                              -- DECOMPILER ERROR at PC259: LeaveBlock: unexpected jumping out IF_THEN_STMT

                              -- DECOMPILER ERROR at PC259: LeaveBlock: unexpected jumping out IF_STMT

                              -- DECOMPILER ERROR at PC259: LeaveBlock: unexpected jumping out IF_THEN_STMT

                              -- DECOMPILER ERROR at PC259: LeaveBlock: unexpected jumping out IF_STMT

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
        end
      end
    end
  end
end
local l_0_26 = 0
for l_0_30 in pairs(l_0_4) do
end
if l_0_26 < 3 then
  return mp.CLEAN
end
local l_0_31 = (table.concat)(l_0_3, "|")
if #l_0_31 > 2000 then
  l_0_31 = (string.sub)(l_0_31, 1, 2000)
end
;
(bm.add_related_string)("WinRMRecon_count", tostring(l_0_26), bm.RelatedStringBMReport)
;
(bm.add_related_string)("WinRMRecon_cmds", l_0_31, bm.RelatedStringBMReport)
TrackPidAndTechniqueBM("BM", "T1021.006", "WinRMRecon")
add_parents()
return mp.INFECTED

