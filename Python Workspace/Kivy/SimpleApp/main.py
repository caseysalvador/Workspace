import kivy.app
import kivy.uix.boxlayout
import kivy.uix.textinput
import kivy.uix.label
import kivy.uix.button

class SimpleApp(kivy.app.App):
    def build(self):
        # Text Box
        self.textInput = kivy.uix.textinput.TextInput(text="Enter your new message here.") # Text Box
        self.label = kivy.uix.label.Label(text="Your Message.") # This is the message box where text will appear.

        # Button
        self.button = kivy.uix.button.Button(text="Click Me.") # This is the button to make text appear in the label (mid section).
        self.button.bind(on_press=self.displayMessage)

        # Layout
        self.boxLayout = kivy.uix.boxlayout.BoxLayout(orientation="vertical")
        self.boxLayout.add_widget(self.textInput)
        self.boxLayout.add_widget(self.label)
        self.boxLayout.add_widget(self.button)
        return self.boxLayout

    def displayMessage(self, btn):
        # Displays message in label
        self.label.text = self.textInput.text

if __name__ == "__main__":
    simpleApp = SimpleApp()
    simpleApp.run()