-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#SLFNodePackageInstallMac\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.get_contextdata)(mp.CONTEXT_DATA_PROCESSNAME)
if l_0_0 == nil then
  return mp.CLEAN
end
l_0_0 = l_0_0:lower()
local l_0_1 = 0
local l_0_2 = l_0_0:find("/", 1, true)
while l_0_2 ~= nil do
  l_0_1 = l_0_2
  l_0_2 = l_0_0:find("/", l_0_1 + 1, true)
end
if l_0_1 > 0 then
  l_0_0 = l_0_0:sub(l_0_1 + 1)
end
local l_0_3 = {}
l_0_3.node = true
l_0_3.npm = true
l_0_3.npx = true
l_0_3.pnpm = true
l_0_3.yarn = true
l_0_3.bun = true
l_0_3.corepack = true
if not l_0_3[l_0_0] then
  return mp.CLEAN
end
local l_0_4 = (mp.getfilename)((mp.bitor)(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_4 ~= "package.json" then
  return mp.CLEAN
end
local l_0_5 = (mp.getfilename)(0)
if l_0_5 == nil or l_0_5:find("/node_modules/", 1, true) == nil and l_0_5:find("/_npx/", 1, true) == nil then
  return mp.CLEAN
end
local l_0_6 = (mp.get_contextdata)(mp.CONTEXT_DATA_PROCESS_PPID)
if l_0_6 == nil then
  return mp.CLEAN
end
local l_0_7 = {}
l_0_7.install = true
l_0_7.i = true
l_0_7.ci = true
l_0_7.add = true
l_0_7.update = true
l_0_7.up = true
l_0_7.upgrade = true
l_0_7.exec = true
l_0_7.dlx = true
l_0_7.x = true
local l_0_8 = {}
l_0_8["npm-cli.js"] = true
l_0_8["npx-cli.js"] = true
l_0_8["pnpm.cjs"] = true
l_0_8["pnpm.js"] = true
l_0_8["yarn.js"] = true
l_0_8["yarn.cjs"] = true
l_0_8["corepack.cjs"] = true
l_0_8.npm = true
l_0_8.npx = true
l_0_8.pnpm = true
l_0_8.yarn = true
l_0_8.corepack = true
do
  if not (function(l_3_0, l_3_1)
  -- function num : 0_2 , upvalues : l_0_10
  local l_3_2 = l_3_0
  for l_3_6 = 0, 5 do
    local l_3_7 = (mp.GetProcessCommandLine)(l_3_1)
    if l_0_10(l_3_2, l_3_7) then
      return true
    end
    if l_3_6 == 5 then
      break
    end
    local l_3_8 = (mp.GetParentProcInfo)(l_3_1)
    if l_3_8 ~= nil then
      do
        if l_3_8.ppid == nil then
          break
        end
        l_3_2 = nil
        if l_3_8.image_path ~= nil then
          l_3_2 = ((string.lower)(l_3_8.image_path)):match("([^/]+)$")
        end
        l_3_1 = l_3_8.ppid
        -- DECOMPILER ERROR at PC43: LeaveBlock: unexpected jumping out IF_THEN_STMT

        -- DECOMPILER ERROR at PC43: LeaveBlock: unexpected jumping out IF_STMT

      end
    end
  end
  return false
end
)(l_0_0, l_0_6) then
    return mp.CLEAN
  end
  do return mp.INFECTED end
  -- DECOMPILER ERROR at PC141: freeLocal<0 in 'ReleaseLocals'

  -- WARNING: undefined locals caused missing assignments!
end

