-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\a8b37457f575\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = this_sigattrlog[1]
if l_0_0 and l_0_0.matched then
  if type(l_0_0.utf8p1) ~= "string" then
    return mp.CLEAN
  end
  local l_0_1 = (string.match)((l_0_0.utf8p1):lower(), "([^/]+)$")
  local l_0_2 = contains
  local l_0_3 = l_0_1
  local l_0_4 = {}
  -- DECOMPILER ERROR at PC27: No list found for R4 , SetList fails

  -- DECOMPILER ERROR at PC32: Overwrote pending register: R2 in 'AssignReg'

  -- DECOMPILER ERROR at PC33: Overwrote pending register: R2 in 'AssignReg'

  if not l_0_2 then
    return l_0_2
  end
end
do
  local l_0_5 = this_sigattrlog[4]
  -- DECOMPILER ERROR at PC39: Overwrote pending register: R2 in 'AssignReg'

  if not l_0_5 or not l_0_2 or type(l_0_5.utf8p1) ~= "string" or type(l_0_5.utf8p2) ~= "string" then
    return mp.CLEAN
  end
  local l_0_6 = (string.match)((l_0_5.utf8p1):lower(), "([^/]+)$")
  local l_0_7 = (l_0_5.utf8p2):lower()
  local l_0_8 = {}
  -- DECOMPILER ERROR at PC77: Overwrote pending register: R6 in 'AssignReg'

  local l_0_12 = l_0_8[l_0_6] == true
  if l_0_12 then
    local l_0_13 = "^php%-cgi[%d%.%-]*$"
    local l_0_14 = (string.match)(l_0_7, "%s%-[a-z]*c[a-z]*%s+[\'\"]?%s*([^%s\'\";&|<>]+)")
    l_0_13 = (string.match)(l_0_14 or "", "([^/]+)$") or l_0_6
    local l_0_16 = containsall
    l_0_16 = l_0_16(l_0_7, {"/dev/tcp/", ">"})
    if not l_0_16 then
      do
        do
          l_0_16 = containsall
          l_0_16 = l_0_16(l_0_7, {"mkfifo", "|"})
          if l_0_16 then
            l_0_16 = contains
            l_0_16 = l_0_16(l_0_7, {"%f[%w]nc%f[%W]", "%f[%w]ncat%f[%W]", "%f[%w]netcat%f[%W]"}, false)
            if l_0_16 then
              l_0_16 = contains
              l_0_16 = l_0_16(l_0_7, {"/bin/sh", "/bin/bash"})
              if l_0_16 then
                l_0_16 = mp
                l_0_16 = l_0_16.INFECTED
                return l_0_16
              end
            end
          end
          -- DECOMPILER ERROR at PC136: Confused about usage of register: R6 in 'UnsetPending'

          -- DECOMPILER ERROR at PC138: Confused about usage of register: R6 in 'UnsetPending'

          -- DECOMPILER ERROR at PC140: Confused about usage of register: R6 in 'UnsetPending'

          if l_0_13 == "whoami" or l_0_13 == "id" or l_0_13 == "uname" and contains(l_0_7, "%s%-a%f[%W]", false) then
            return mp.INFECTED
          end
          -- DECOMPILER ERROR at PC152: Confused about usage of register: R6 in 'UnsetPending'

          -- DECOMPILER ERROR at PC154: Confused about usage of register: R6 in 'UnsetPending'

          if l_0_13 == "curl" or l_0_13 == "wget" then
            local l_0_17 = nil
            local l_0_18 = nil
            local l_0_19 = contains
            l_0_19 = l_0_19(l_0_7, {"http://", "https://"})
            if l_0_19 then
              l_0_19 = mp
              l_0_19 = l_0_19.INFECTED
              return l_0_19
            end
          end
          -- DECOMPILER ERROR at PC168: Confused about usage of register: R6 in 'UnsetPending'

          -- DECOMPILER ERROR at PC170: Confused about usage of register: R6 in 'UnsetPending'

          -- DECOMPILER ERROR at PC172: Confused about usage of register: R6 in 'UnsetPending'

          if (l_0_18 == "nc" or l_0_18 == "ncat" or l_0_18 == "netcat") and contains(l_0_7, "%s%-[ec][%s/]", false) then
            local l_0_20 = nil
            local l_0_21 = nil
            local l_0_22 = contains
            l_0_22 = l_0_22(l_0_7, {"/bin/sh", "/bin/bash"})
            if l_0_22 then
              l_0_22 = mp
              l_0_22 = l_0_22.INFECTED
              return l_0_22
            end
          end
          -- DECOMPILER ERROR at PC193: Confused about usage of register: R6 in 'UnsetPending'

          -- DECOMPILER ERROR at PC197: Confused about usage of register: R6 in 'UnsetPending'

          if l_0_21 and (string.match)(l_0_21, "^python%d*%.?%d*$") and contains(l_0_7, "%s%-c[%s\'\"]", false) then
            local l_0_23 = nil
            local l_0_24 = nil
            local l_0_25 = containsall
            l_0_25 = l_0_25(l_0_7, {"socket", "connect", "dup2"})
            if l_0_25 then
              l_0_25 = contains
              l_0_25 = l_0_25(l_0_7, {"subprocess", "os.system", "pty.spawn"})
              if l_0_25 then
                l_0_25 = mp
                l_0_25 = l_0_25.INFECTED
                return l_0_25
              end
            end
          end
          -- DECOMPILER ERROR at PC232: Confused about usage of register: R6 in 'UnsetPending'

          if l_0_24 == "perl" and contains(l_0_7, "%s%-[a-z]*e[%s\'\"]", false) then
            local l_0_26 = nil
            local l_0_27 = nil
            local l_0_28 = containsall
            l_0_28 = l_0_28(l_0_7, {"socket", "connect", "exec"})
            if l_0_28 then
              l_0_28 = contains
              l_0_28 = l_0_28(l_0_7, {"/bin/sh", "/bin/bash"})
              if l_0_28 then
                l_0_28 = mp
                l_0_28 = l_0_28.INFECTED
                return l_0_28
              end
            end
          end
          -- DECOMPILER ERROR at PC263: Confused about usage of register: R6 in 'UnsetPending'

          -- DECOMPILER ERROR at PC267: Confused about usage of register: R6 in 'UnsetPending'

          if l_0_27 and (string.match)(l_0_27, "^php[%d%.]*$") and contains(l_0_7, "%s%-r[%s\'\"]", false) and contains(l_0_7, "fsockopen") then
            local l_0_29 = nil
            local l_0_30 = nil
            local l_0_31 = contains
            l_0_31 = l_0_31(l_0_7, {"proc_open", "popen", "shell_exec", "exec("})
            if l_0_31 then
              l_0_31 = mp
              l_0_31 = l_0_31.INFECTED
              return l_0_31
            end
          end
          do return mp.CLEAN end
          -- DECOMPILER ERROR at PC302: freeLocal<0 in 'ReleaseLocals'

          -- DECOMPILER ERROR: 14 unprocessed JMP targets
        end
      end
    end
  end
end

