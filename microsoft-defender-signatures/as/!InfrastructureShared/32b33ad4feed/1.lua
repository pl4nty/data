-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\32b33ad4feed\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = add_parents_mp()
local l_0_1 = {}
l_0_1.parents_info_mp = l_0_0
if (this_sigattrlog[1]).matched and (this_sigattrlog[1]).utf8p2 then
  l_0_1.parent_OFN = (this_sigattrlog[1]).utf8p2
end
for l_0_5,l_0_6 in ipairs(l_0_0) do
  if l_0_6.ImagePath then
    local l_0_7 = (mp.ContextualExpandEnvironmentVariables)(l_0_6.ImagePath)
    if contains(l_0_7, "onedrive") then
      do
        do
          (bm.add_threat_file)(l_0_7)
          do break end
          -- DECOMPILER ERROR at PC40: LeaveBlock: unexpected jumping out DO_STMT

          -- DECOMPILER ERROR at PC40: LeaveBlock: unexpected jumping out IF_THEN_STMT

          -- DECOMPILER ERROR at PC40: LeaveBlock: unexpected jumping out IF_STMT

          -- DECOMPILER ERROR at PC40: LeaveBlock: unexpected jumping out IF_THEN_STMT

          -- DECOMPILER ERROR at PC40: LeaveBlock: unexpected jumping out IF_STMT

        end
      end
    end
  end
end
;
(bm.add_related_string)("Additional_Info", safeJsonSerialize(l_0_1), bm.RelatedStringBMReport)
return mp.INFECTED

