-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\a348_517.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetParentProcInfo)()
if l_0_0 ~= nil then
  local l_0_1 = (string.lower)(l_0_0.image_path)
  if l_0_1:match("([^\\]+)$") == "services.exe" or l_0_1:match("([^\\]+)$") == "wmiprvse.exe" then
    if (versioning.IsSeville)() then
      local l_0_2 = (versioning.GetOrgID)()
      if l_0_2 ~= nil then
        l_0_2 = (string.lower)(l_0_2)
        local l_0_3 = {}
        l_0_3["d40e70ae-4b88-4c7e-944d-68c92494028c"] = true
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

