from __future__ import (absolute_import, division, print_function)
__metaclass__ = type

from ansible.plugins.action import ActionBase


class ActionModule(ActionBase):
    def run(self, tmp=None, task_vars=None):
        super(ActionModule, self).run(tmp, task_vars)
        print(task_vars['kuboardspray_operation'])
        module_args = self._task.args.copy()
        if task_vars['kuboardspray_operation'] == 'remove_addon':
            if (module_args['resource'] == 'ns'):
                print("ignore namespace ", module_args['namespace'])
            else:
                module_args['state'] = 'absent'

        module_return = self._execute_module(module_name='kube',
                                             module_args=module_args,
                                             task_vars=task_vars, tmp=tmp)
        return module_return