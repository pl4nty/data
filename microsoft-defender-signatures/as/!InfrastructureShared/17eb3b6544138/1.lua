-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\17eb3b6544138\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = function(l_1_0)
  -- function num : 0_0
  local l_1_1 = {}
  l_1_1[".bat"] = true
  l_1_1[".cmd"] = true
  l_1_1[".ps1"] = true
  if l_1_0.procInfo then
    if (l_1_0.procInfo).cmdline then
      bm_AddRelatedFileFromCommandLine(((l_1_0.procInfo).cmdline):lower(), l_1_1, nil, 1)
    end
    if (l_1_0.procInfo).shellScripts then
      for l_1_5,l_1_6 in ipairs((l_1_0.procInfo).shellScripts) do
        if (sysio.IsFileExists)(l_1_6) then
          (bm.add_related_file)(l_1_6)
        end
      end
    end
  end
  do
    if l_1_0.parents then
      for l_1_10,l_1_11 in ipairs(l_1_0.parents) do
        if l_1_11.cmdline then
          bm_AddRelatedFileFromCommandLine((l_1_11.cmdline):lower(), l_1_1, nil, 1)
        end
        if l_1_11.shellScripts then
          for l_1_15,l_1_16 in ipairs(l_1_11.shellScripts) do
            if (sysio.IsFileExists)(l_1_16) then
              (bm.add_related_file)(l_1_16)
            end
          end
        end
      end
    end
  end
end

local l_0_2 = function(l_2_0, l_2_1)
  -- function num : 0_1 , upvalues : l_0_0
  local l_2_2 = GetRollingQueue(l_2_1)
  if l_2_2 ~= nil and type(l_2_2) == "table" then
    local l_2_3 = l_2_0:lower()
    local l_2_4 = l_2_3:match("%.([^%.]+)$")
    for l_2_8 in pairs(l_2_2) do
      local l_2_9 = safeJsonDeserialize((l_2_2[l_2_8]).key)
      if l_2_9 and l_2_9.type and l_2_9.event then
        local l_2_10 = (l_2_9.event):lower()
        if (string.find)(l_2_9.type, "BM_Exclusion", 1, true) then
          do
            if not l_2_10:match("\\exclusions\\paths\\\\(.+)$") then
              local l_2_11 = l_2_10:match("\\exclusions\\processes\\\\(.+)$")
            end
            -- DECOMPILER ERROR at PC51: Confused about usage of register: R11 in 'UnsetPending'

            -- DECOMPILER ERROR at PC55: Confused about usage of register: R11 in 'UnsetPending'

            do
              if l_2_11 ~= nil then
                local l_2_12, l_2_13 = (MpCommon.ExpandEnvironmentVariables)(l_2_11)
                l_2_13 = l_2_13(l_2_12)
                l_2_13 = l_2_13(l_2_13, "%.", "%%.")
                l_2_13 = l_2_13(l_2_13, "?", ".")
                l_2_13 = l_2_13(l_2_13, "*", "[^\\]+")
                l_2_12 = l_2_13
                l_2_13 = l_2_13(l_2_3, l_2_12)
                if l_2_13 then
                  l_2_13 = bm
                  l_2_13 = l_2_13.add_related_string
                  l_2_13("Tampering_Events", (l_2_2[l_2_8]).key, bm.RelatedStringBMReport)
                  l_2_13 = l_0_0
                  l_2_13(l_2_9)
                  l_2_13 = true
                  return l_2_13
                end
              end
              do
                do
                  local l_2_14 = nil
                  if l_2_10:match("\\exclusions\\extensions\\\\%W*(%w+)$") ~= nil and l_2_4 == (l_2_10:match("\\exclusions\\extensions\\\\%W*(%w+)$")):lower() then
                    (bm.add_related_string)("Tampering_Events", (l_2_2[l_2_8]).key, bm.RelatedStringBMReport)
                    l_0_0(l_2_9)
                    return true
                  end
                  if (string.find)(l_2_9.type, "AMSI_Exclusion", 1, true) then
                    for l_2_18 in (string.gmatch)(l_2_10, "[^;]+") do
                      do
                        if not l_2_18:match("path|(.+)$") then
                          local l_2_19 = l_2_10:match("process|(.+)$")
                        end
                        -- DECOMPILER ERROR at PC137: Confused about usage of register: R15 in 'UnsetPending'

                        -- DECOMPILER ERROR at PC141: Confused about usage of register: R15 in 'UnsetPending'

                        do
                          if l_2_19 ~= nil then
                            local l_2_20, l_2_21 = (MpCommon.ExpandEnvironmentVariables)(l_2_19)
                            l_2_21 = l_2_21(l_2_20)
                            l_2_21 = l_2_21(l_2_21, "%.", "%%.")
                            l_2_21 = l_2_21(l_2_21, "?", ".")
                            l_2_21 = l_2_21(l_2_21, "*", "[^\\]+")
                            l_2_20 = l_2_21
                            l_2_21 = l_2_21(l_2_3, l_2_20)
                            if l_2_21 then
                              l_2_21 = bm
                              l_2_21 = l_2_21.add_related_string
                              l_2_21("Tampering_Events", (l_2_2[l_2_8]).key, bm.RelatedStringBMReport)
                              l_2_21 = l_0_0
                              l_2_21(l_2_9)
                              l_2_21 = true
                              return l_2_21
                            end
                          end
                          do
                            local l_2_22 = nil
                            if l_2_10:match("extension|%W*(%w+)$") ~= nil and l_2_4 == (l_2_10:match("extension|%W*(%w+)$")):lower() then
                              (bm.add_related_string)("Tampering_Events", (l_2_2[l_2_8]).key, bm.RelatedStringBMReport)
                              l_0_0(l_2_9)
                              return true
                            end
                            -- DECOMPILER ERROR at PC199: LeaveBlock: unexpected jumping out DO_STMT

                            -- DECOMPILER ERROR at PC199: LeaveBlock: unexpected jumping out DO_STMT

                          end
                        end
                      end
                    end
                  end
                  -- DECOMPILER ERROR at PC201: LeaveBlock: unexpected jumping out DO_STMT

                  -- DECOMPILER ERROR at PC201: LeaveBlock: unexpected jumping out DO_STMT

                  -- DECOMPILER ERROR at PC201: LeaveBlock: unexpected jumping out DO_STMT

                  -- DECOMPILER ERROR at PC201: LeaveBlock: unexpected jumping out IF_THEN_STMT

                  -- DECOMPILER ERROR at PC201: LeaveBlock: unexpected jumping out IF_STMT

                  -- DECOMPILER ERROR at PC201: LeaveBlock: unexpected jumping out IF_THEN_STMT

                  -- DECOMPILER ERROR at PC201: LeaveBlock: unexpected jumping out IF_STMT

                end
              end
            end
          end
        end
      end
    end
  end
  l_2_3 = false
  do return l_2_3 end
  -- DECOMPILER ERROR at PC205: Confused about usage of register R6 for local variables in 'ReleaseLocals'

end

if (bm.get_imagepath)() == nil then
  return mp.CLEAN
end
local l_0_3 = (MpCommon.PathToWin32Path)((bm.get_imagepath)())
if l_0_2(l_0_3, "TamperingTracking") then
  add_parents()
  return mp.INFECTED
end
do
  local l_0_4 = nil
  if (reportSessionInformation()).User and ((reportSessionInformation()).User).UserName then
    l_0_4 = l_0_4 .. "-" .. ((reportSessionInformation()).User).UserName
    if l_0_2(l_0_3, l_0_4) then
      add_parents()
      return mp.INFECTED
    end
  end
  do return mp.CLEAN end
  -- DECOMPILER ERROR at PC56: freeLocal<0 in 'ReleaseLocals'

end

