-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\5f8b37b153662\1.luac 

-- params : ...
-- function num : 0
if (((((this_sigattrlog[2] ~= nil and (this_sigattrlog[2]).matched) or (this_sigattrlog[3] ~= nil and (this_sigattrlog[3]).matched) or (this_sigattrlog[4] ~= nil and (this_sigattrlog[4]).matched) or (this_sigattrlog[5] ~= nil and (this_sigattrlog[5]).matched) or (this_sigattrlog[6] ~= nil and (this_sigattrlog[6]).matched) or IsWinRMSessionForPpid("BM", nil, nil) or not IsWinRMSessionFoundInParents("BM", nil, 4, nil))))) then
  return mp.CLEAN
end
local l_0_0 = nil
if (this_sigattrlog[11]).matched and (this_sigattrlog[11]).utf8p1 ~= nil then
  l_0_0 = (this_sigattrlog[11]).utf8p1
else
  if (this_sigattrlog[13]).matched and (this_sigattrlog[13]).utf8p1 ~= nil then
    l_0_0 = (this_sigattrlog[13]).utf8p1
  else
    if (this_sigattrlog[14]).matched and (this_sigattrlog[14]).utf8p1 ~= nil then
      l_0_0 = (this_sigattrlog[14]).utf8p1
    else
      if (this_sigattrlog[15]).matched and (this_sigattrlog[15]).utf8p1 ~= nil then
        l_0_0 = (this_sigattrlog[15]).utf8p1
      else
        if (this_sigattrlog[16]).matched and (this_sigattrlog[16]).utf8p1 ~= nil then
          l_0_0 = (this_sigattrlog[16]).utf8p1
        else
          if (this_sigattrlog[17]).matched and (this_sigattrlog[17]).utf8p1 ~= nil then
            l_0_0 = (this_sigattrlog[17]).utf8p1
          else
            if (this_sigattrlog[18]).matched and (this_sigattrlog[18]).utf8p1 ~= nil then
              l_0_0 = (this_sigattrlog[18]).utf8p1
            else
              if (this_sigattrlog[19]).matched and (this_sigattrlog[19]).utf8p1 ~= nil then
                l_0_0 = (this_sigattrlog[19]).utf8p1
              else
                if (this_sigattrlog[20]).matched and (this_sigattrlog[20]).utf8p1 ~= nil then
                  l_0_0 = (this_sigattrlog[20]).utf8p1
                else
                  if (this_sigattrlog[12]).matched and (this_sigattrlog[12]).utf8p1 ~= nil then
                    l_0_0 = (this_sigattrlog[12]).utf8p1
                  else
                    if (this_sigattrlog[21]).matched and (this_sigattrlog[21]).utf8p1 ~= nil then
                      l_0_0 = (this_sigattrlog[21]).utf8p1
                    else
                      if (this_sigattrlog[22]).matched and (this_sigattrlog[22]).utf8p1 ~= nil then
                        l_0_0 = (this_sigattrlog[22]).utf8p1
                      else
                        if (this_sigattrlog[23]).matched and (this_sigattrlog[23]).utf8p1 ~= nil then
                          l_0_0 = (this_sigattrlog[23]).utf8p1
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
if l_0_0 == nil then
  return mp.CLEAN
end
l_0_0 = (string.lower)(l_0_0)
if (string.find)(l_0_0, "\\windows\\ntds\\ntds.dit", 1, true) then
  return mp.CLEAN
end
if (string.find)(l_0_0, "\\windows defender\\", 1, true) then
  return mp.CLEAN
end
if (string.find)(l_0_0, "psscriptpolicytest", 1, true) then
  return mp.CLEAN
end
local l_0_1 = {}
-- DECOMPILER ERROR at PC306: No list found for R1 , SetList fails

-- DECOMPILER ERROR at PC307: Overwrote pending register: R2 in 'AssignReg'

-- DECOMPILER ERROR at PC308: Overwrote pending register: R3 in 'AssignReg'

for l_0_5,l_0_6 in ("%.dll$")("%.exe$") do
  -- DECOMPILER ERROR at PC311: Overwrote pending register: R7 in 'AssignReg'

  -- DECOMPILER ERROR at PC313: Overwrote pending register: R8 in 'AssignReg'

  -- DECOMPILER ERROR at PC314: Overwrote pending register: R9 in 'AssignReg'

  if (("%.pdb$").find)("%.nupkg$", "%.log$") then
    return mp.CLEAN
  end
end
local l_0_7 = (string.find)(l_0_0, "\\temp\\", 1, true)
if l_0_7 then
  local l_0_8, l_0_9 = (string.sub)(l_0_0, l_0_7 + 6)
  -- DECOMPILER ERROR at PC338: Overwrote pending register: R4 in 'AssignReg'

  local l_0_10 = nil
  if l_0_10 >= 2 then
    return mp.CLEAN
  end
end
do
  -- DECOMPILER ERROR at PC348: Overwrote pending register: R4 in 'AssignReg'

  -- DECOMPILER ERROR at PC358: Overwrote pending register: R4 in 'AssignReg'

  if (string.find)(l_0_0, "ntds.dit", 1, true) then
    local l_0_12 = nil
    local l_0_11 = l_0_9
  else
    do
      -- DECOMPILER ERROR at PC380: Overwrote pending register: R3 in 'AssignReg'

      if (string.find)(l_0_0, "lsass", 1, true) and (string.find)(l_0_0, ".dmp", 1, true) then
        local l_0_13, l_0_14 = l_0_12, "lsass_dump"
      else
        do
          if (string.find)(l_0_0, "globalroot", 1, true) then
            local l_0_15 = nil
          else
            do
              -- DECOMPILER ERROR at PC408: Overwrote pending register: R4 in 'AssignReg'

              -- DECOMPILER ERROR at PC409: Overwrote pending register: R3 in 'AssignReg'

              if (string.find)(l_0_0, "%.sam$") or (string.match)(l_0_0, "\\sam$") then
                local l_0_16, l_0_17 = l_0_15, "vss_ntds_copy"
              else
                do
                  if (string.find)(l_0_0, "%.system$") or (string.match)(l_0_0, "\\system$") then
                    local l_0_18, l_0_20, l_0_22, l_0_24, l_0_26, l_0_28, l_0_31, l_0_33 = , "system_hive_export", "%.txt$"
                  else
                    do
                      -- DECOMPILER ERROR at PC443: Overwrote pending register: R3 in 'AssignReg'

                      do
                        do
                          if (string.find)(l_0_0, "%.security$") or (string.match)(l_0_0, "\\security$") then
                            local l_0_19, l_0_21, l_0_23, l_0_25, l_0_27, l_0_29, l_0_30, l_0_32 = l_0_18, "security_hive_export"
                          end
                          -- DECOMPILER ERROR at PC444: Confused about usage of register: R4 in 'UnsetPending'

                          if l_0_21 == nil then
                            return mp.CLEAN
                          end
                          ;
                          (bm.add_related_file)(l_0_0)
                          -- DECOMPILER ERROR at PC456: Confused about usage of register: R4 in 'UnsetPending'

                          ;
                          (bm.add_related_string)("WinRMCred_reason", l_0_21, bm.RelatedStringBMReport)
                          ;
                          (bm.add_related_string)("WinRMCred_path", l_0_0, bm.RelatedStringBMReport)
                          -- DECOMPILER ERROR at PC469: Confused about usage of register: R3 in 'UnsetPending'

                          TrackPidAndTechniqueBM("BM", l_0_19, "WinRMCredDump")
                          add_parents()
                          do return mp.INFECTED end
                          -- WARNING: undefined locals caused missing assignments!
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

