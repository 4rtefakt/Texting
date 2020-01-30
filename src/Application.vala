public class MyApp : Gtk.Application {

    public MyApp () {
        Object (
            application_id: "com.github.4rtefakt.texting",
            flags: ApplicationFlags.FLAGS_NONE
        );
    }
    
    // public static GLib.Settings settings;
    // static construct {
    //     settings = new GLib.Settings ("com.github.4rtefakt.texting");
    // }

    protected override void activate () {
        var main_window = new Gtk.ApplicationWindow (this);
        main_window.default_height = 300;
        main_window.default_width = 300;
        main_window.title = _("Hello World");
        
        var grid = new Gtk.Grid ();
        grid.orientation = Gtk.Orientation.VERTICAL;
        grid.row_spacing = 6;

        var button = new Gtk.Button.with_label (_("Click me!"));
        var label = new Gtk.Label (null);
        
        button.clicked.connect (() => {
            label.label = _("Hello World!");
            //button.sensitive = false;
            var notification = new Notification (_("Epickiwi"));
            var icon = new GLib.ThemedIcon ("phone");
            notification.set_icon (icon);
            notification.set_body (_("I use arch btw."));
            this.send_notification ("com.github.4rtefakt.texting", notification);
        });

        grid.add (button);
        grid.add (label);

        main_window.add (grid);
        main_window.show_all ();
    }

    public static int main (string[] args) {
        var app = new MyApp ();
        return app.run (args);
    }
}
