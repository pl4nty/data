-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\641b3906cecf5\1.luac 

-- params : ...
-- function num : 0
if not IsDeviceHVA() then
  return mp.CLEAN
end
local l_0_0 = nil
if (this_sigattrlog[12]).matched and (this_sigattrlog[12]).utf8p1 ~= nil then
  l_0_0 = (this_sigattrlog[12]).utf8p1
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
-- DECOMPILER ERROR at PC237: No list found for R1 , SetList fails

-- DECOMPILER ERROR at PC238: Overwrote pending register: R2 in 'AssignReg'

-- DECOMPILER ERROR at PC239: Overwrote pending register: R3 in 'AssignReg'

for l_0_5,l_0_6 in ("%.dll$")("%.exe$") do
  -- DECOMPILER ERROR at PC242: Overwrote pending register: R7 in 'AssignReg'

  -- DECOMPILER ERROR at PC244: Overwrote pending register: R8 in 'AssignReg'

  -- DECOMPILER ERROR at PC245: Overwrote pending register: R9 in 'AssignReg'

  if (("%.pdb$").find)("%.nupkg$", "%.log$") then
    return mp.CLEAN
  end
end
local l_0_7 = (string.find)(l_0_0, "\\temp\\", 1, true)
if l_0_7 then
  local l_0_8, l_0_9 = (string.sub)(l_0_0, l_0_7 + 6)
  -- DECOMPILER ERROR at PC269: Overwrote pending register: R4 in 'AssignReg'

  local l_0_10 = nil
  if l_0_10 >= 2 then
    return mp.CLEAN
  end
end
do
  -- DECOMPILER ERROR at PC279: Overwrote pending register: R4 in 'AssignReg'

  -- DECOMPILER ERROR at PC289: Overwrote pending register: R4 in 'AssignReg'

  if (string.find)(l_0_0, "ntds.dit", 1, true) then
    local l_0_12 = nil
    local l_0_11 = l_0_9
  else
    do
      -- DECOMPILER ERROR at PC302: Overwrote pending register: R3 in 'AssignReg'

      if (string.find)(l_0_0, "globalroot", 1, true) then
        local l_0_13, l_0_14 = l_0_12, "vss_ntds_copy"
      else
        do
          if (string.find)(l_0_0, "%.sam$") or (string.match)(l_0_0, "\\sam$") then
            local l_0_15 = nil
          else
            do
              -- DECOMPILER ERROR at PC335: Overwrote pending register: R4 in 'AssignReg'

              -- DECOMPILER ERROR at PC336: Overwrote pending register: R3 in 'AssignReg'

              if (string.find)(l_0_0, "%.system$") or (string.match)(l_0_0, "\\system$") then
                local l_0_16, l_0_17, l_0_19, l_0_21, l_0_23, l_0_25, l_0_26, l_0_28 = l_0_15, "sam_hive_export", "%.txt$"
              else
                do
                  do
                    do
                      if (string.find)(l_0_0, "%.security$") or (string.match)(l_0_0, "\\security$") then
                        local l_0_18, l_0_20, l_0_22, l_0_24, l_0_27, l_0_29 = , "security_hive_export"
                      end
                      -- DECOMPILER ERROR at PC354: Confused about usage of register: R4 in 'UnsetPending'

                      if l_0_20 == nil then
                        return mp.CLEAN
                      end
                      ;
                      (bm.add_related_file)(l_0_0)
                      -- DECOMPILER ERROR at PC366: Confused about usage of register: R4 in 'UnsetPending'

                      ;
                      (bm.add_related_string)("WinRMCred_reason", l_0_20, bm.RelatedStringBMReport)
                      ;
                      (bm.add_related_string)("WinRMCred_path", l_0_0, bm.RelatedStringBMReport)
                      TrackPidAndTechniqueBM("BM", l_0_18, "WinRMCredDump")
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

