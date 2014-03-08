import krpc
import time
import unittest
import os
import shutil

KSP_DIR='../../Kerbal Space Program'

def load_save(name):
    save_dir = KSP_DIR + '/saves/test'
    if not os.path.exists(save_dir):
        os.makedirs(save_dir)
    shutil.copy('fixtures/' + name + '.sfs', save_dir + '/' + name + '.sfs')
    # Connect and issue load save RPC
    ksp = krpc.connect(name='testingtools.load_save')
    ksp.TestingTools.LoadSave('test', name)
    time.sleep(1)
    # Wait until server comes back up
    while True:
        try:
            ksp = krpc.connect(name='testingtools.load_save')
            break
	except:
            time.sleep(0.2)
            pass

class TestCase(unittest.TestCase):

    def assertBetween(self, min_value, max_value, value):
        self.assertLessEqual(min_value, value)
        self.assertLessEqual(value, max_value)

    def assertNotBetween(self, min_value, max_value, value):
        self.assertTrue(value < min_value or max_value < value)
