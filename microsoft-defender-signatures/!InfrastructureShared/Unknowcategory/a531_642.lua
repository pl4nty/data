-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\a531_642.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetParentProcInfo)()
if l_0_0 ~= nil then
  local l_0_1 = (string.lower)(l_0_0.image_path)
  if l_0_1:match("([^\\]+)$") == "wmiprvse.exe" or l_0_1:match("([^\\]+)$") == "explorer.exe" or l_0_1:match("([^\\]+)$") == "mmc.exe" then
    if (versioning.IsSeville)() then
      local l_0_2 = (versioning.GetOrgID)()
      if l_0_2 ~= nil then
        l_0_2 = (string.lower)(l_0_2)
        local l_0_3 = {}
        l_0_3["d542d020-ab72-4d56-b7b6-b9f1e998a75a"] = true
        l_0_3["2135e9fa-2274-4c30-a08d-e47c01dda1ec"] = true
        l_0_3["3dc7d3ea-10d3-4100-987a-21d7cccef59b"] = true
        if l_0_3[l_0_2] then
          return mp.LOWFI
        end
      end
      do
        do
          do
            do return mp.INFECTED end
            do return mp.LOWFI end
            return mp.CLEAN
          end
        end
      end
    end
  end
end

