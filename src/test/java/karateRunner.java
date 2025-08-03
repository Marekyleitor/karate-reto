import com.intuit.karate.junit5.Karate;

public class karateRunner {
    //listarUsuario.feature
    //buscarUsuarioPorId.feature
    //registrarUsuario.feature
    //eliminarUsuario.feature
    //actualizarUsuario.feature

    @Karate.Test
    Karate testSample() {
        return Karate.run("classpath:actualizarUsuario.feature");
    }
}
