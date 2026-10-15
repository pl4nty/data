-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\175b3d2710ed6\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (versioning.GetOrgID)()
if isnull(l_0_0) then
  return mp.CLEAN
end
local l_0_1 = {}
l_0_1["26e8b179-9fbe-40fd-8f34-37cdee8c4766"] = true
l_0_1["e6e2b814-cd64-4ac3-9e16-91753ff30617"] = true
l_0_1["bcfa1838-fccc-4999-9d5b-5ec1ac1a4776"] = true
l_0_1["9ee8ddb9-e98f-4b86-a160-fe3b96f39cc6"] = true
if not l_0_1[(string.lower)(l_0_0)] then
  return mp.CLEAN
end
if not (this_sigattrlog[2]).matched then
  return mp.CLEAN
end
local l_0_2, l_0_3, l_0_4 = nil, nil, nil
if (this_sigattrlog[3]).matched and not isnull((this_sigattrlog[3]).utf8p1) then
  l_0_2 = "NewAsp"
else
  -- DECOMPILER ERROR at PC71: Overwrote pending register: R4 in 'AssignReg'

  -- DECOMPILER ERROR at PC72: Overwrote pending register: R3 in 'AssignReg'

  if (this_sigattrlog[4]).matched and not isnull((this_sigattrlog[4]).utf8p1) then
    l_0_2 = "NewAshx"
  else
    -- DECOMPILER ERROR at PC91: Overwrote pending register: R4 in 'AssignReg'

    -- DECOMPILER ERROR at PC92: Overwrote pending register: R3 in 'AssignReg'

    if (this_sigattrlog[5]).matched and not isnull((this_sigattrlog[5]).utf8p1) then
      l_0_2 = "NewAsmx"
    else
      -- DECOMPILER ERROR at PC111: Overwrote pending register: R4 in 'AssignReg'

      -- DECOMPILER ERROR at PC112: Overwrote pending register: R3 in 'AssignReg'

      if (this_sigattrlog[6]).matched and not isnull((this_sigattrlog[6]).utf8p1) then
        l_0_2 = "NewAsax"
      else
        -- DECOMPILER ERROR at PC131: Overwrote pending register: R4 in 'AssignReg'

        -- DECOMPILER ERROR at PC132: Overwrote pending register: R3 in 'AssignReg'

        if (this_sigattrlog[7]).matched and not isnull((this_sigattrlog[7]).utf8p1) then
          l_0_2 = "NewAscx"
        else
          -- DECOMPILER ERROR at PC151: Overwrote pending register: R4 in 'AssignReg'

          -- DECOMPILER ERROR at PC152: Overwrote pending register: R3 in 'AssignReg'

          if (this_sigattrlog[8]).matched and not isnull((this_sigattrlog[8]).utf8p1) then
            l_0_2 = "NewPhp"
          else
            -- DECOMPILER ERROR at PC171: Overwrote pending register: R4 in 'AssignReg'

            -- DECOMPILER ERROR at PC172: Overwrote pending register: R3 in 'AssignReg'

            if (this_sigattrlog[9]).matched and not isnull((this_sigattrlog[9]).utf8p1) then
              l_0_2 = "ModAsp"
            else
              -- DECOMPILER ERROR at PC191: Overwrote pending register: R4 in 'AssignReg'

              -- DECOMPILER ERROR at PC192: Overwrote pending register: R3 in 'AssignReg'

              if (this_sigattrlog[10]).matched and not isnull((this_sigattrlog[10]).utf8p1) then
                l_0_2 = "ModAshx"
              else
                return mp.CLEAN
              end
            end
          end
        end
      end
    end
  end
end
local l_0_5 = (string.lower)(l_0_3)
if (string.find)(l_0_5, "\\temporary asp.net files\\", 1, true) then
  return mp.CLEAN
end
if (string.find)(l_0_5, "\\microsoft.net\\framework", 1, true) then
  return mp.CLEAN
end
if (string.find)(l_0_5, "\\assembly\\nativeimages", 1, true) then
  return mp.CLEAN
end
if (string.find)(l_0_5, "\\windows\\servicing\\", 1, true) then
  return mp.CLEAN
end
do
  if not StringEndsWith(l_0_5, ".asp") and not StringEndsWith(l_0_5, ".aspx") and not StringEndsWith(l_0_5, ".ashx") and not StringEndsWith(l_0_5, ".asmx") and not StringEndsWith(l_0_5, ".asax") and not StringEndsWith(l_0_5, ".ascx") then
    local l_0_6 = StringEndsWith(l_0_5, ".php")
  end
  -- DECOMPILER ERROR at PC290: Confused about usage of register: R6 in 'UnsetPending'

  if not l_0_6 then
    return mp.CLEAN
  end
  local l_0_7 = nil
  ;
  (bm.add_related_string)("iis_drop_path", l_0_3, bm.RelatedStringBMReport)
  ;
  (bm.add_related_string)("iis_drop_op", l_0_4, bm.RelatedStringBMReport)
  ;
  (bm.add_related_string)("iis_drop_rule", l_0_2, bm.RelatedStringBMReport)
  ;
  (bm.add_related_string)("iis_drop_in_webroot", tostring(contains(l_0_5, {"\\inetpub\\", "\\wwwroot\\", "\\aspnet_client\\", "\\web server extensions\\", "\\clientaccess\\", "\\frontend\\httpproxy\\", "\\owa\\", "\\ecp\\", "\\exchweb\\"}, true)), bm.RelatedStringBMReport)
  if not (mp.IsKnownFriendlyFile)(l_0_3, true, false) then
    (bm.add_related_file)(l_0_3)
  end
  add_parents()
  TrackPidAndTechniqueBM("BM", "T1505.003", "iis_webshell_drop", 28800)
  return mp.INFECTED
end

