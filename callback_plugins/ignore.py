# (c) 2012-2014, Michael DeHaan <michael.dehaan@gmail.com>
# (c) 2017 Ansible Project
# GNU General Public License v3.0+ (see COPYING or https://www.gnu.org/licenses/gpl-3.0.txt)

# Make coding more python3-ish
from __future__ import (absolute_import, division, print_function)
__metaclass__ = type

DOCUMENTATION = '''
    name: ignore
'''

from ansible.plugins.callback import CallbackBase
from ansible import constants as C

class CallbackModule(CallbackBase):

    '''
    提示用户忽略标注为 ignore 的错误提示。
    '''

    CALLBACK_VERSION = 2.0
    CALLBACK_NAME = 'ignore'

    def v2_runner_on_failed(self, result, ignore_errors=False):
        if ignore_errors:
            self._display.display("出现此错误提示属于正常情况，请忽略", color=C.COLOR_SKIP)
